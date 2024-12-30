import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/tm_app_bar.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() => _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ScreenBackground(
          child: _buildTaskListView(),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const TaskItemWidget();
        });
  }
}