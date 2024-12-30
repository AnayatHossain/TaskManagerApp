import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/task_item_widget.dart';
import '../widgets/tm_app_bar.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
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