import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';
import '../../data/services/network_coller.dart';

// Controller class for GetX
class AddNewTaskController extends GetxController {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool addNewTaskInProgress = false.obs;

  @override
  void onClose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    super.onClose();
  }

  // Method to create a new task
  Future<void> createNewTask() async {
    addNewTaskInProgress.value = true;
    Map<String, dynamic> requestBody = {
      "title": titleTEController.text.trim(),
      "description": descriptionTEController.text.trim(),
      "status": "New"
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createTaskUrl,
      body: requestBody,
    );
    addNewTaskInProgress.value = false;

    if (response.isSuccess) {
      clearTextFields();
      showSnackBarMessage(Get.context!, 'New task added!');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage);
    }
  }

  void clearTextFields() {
    titleTEController.clear();
    descriptionTEController.clear();
  }
}

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  Widget build(BuildContext context) {
    final AddNewTaskController controller = Get.put(AddNewTaskController());
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text('Add New Task', style: textTheme.titleLarge),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.titleTEController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.descriptionTEController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your description here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return Visibility(
                      visible: !controller.addNewTaskInProgress.value,
                      replacement: const CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.createNewTask();
                          }
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
