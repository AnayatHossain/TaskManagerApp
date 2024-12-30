import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_counter_widget.dart';
import '../widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTasksSummaryByStatus(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildTaskListView(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, AddNewTaskScreen.name);
      },
        child: const Icon(Icons.add),
      
      ),
    );
  }

Widget _buildTaskListView() {
    return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TaskItemWidget();
                });
  }

  Widget _buildTasksSummaryByStatus() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TaskStatusSummaryCounterWidget(
              count: '13',
              title: 'New',
            ),
            TaskStatusSummaryCounterWidget(
              count: '13',
              title: 'Progress',
            ),
            TaskStatusSummaryCounterWidget(
              count: '13',
              title: 'Completed',
            ),
            TaskStatusSummaryCounterWidget(
              count: '13',
              title: 'Cancelled',
            ),
          ],
        ),
      ),
    );
  }
}
