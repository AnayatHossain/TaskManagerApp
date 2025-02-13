import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        home: TaskManagerApp(),
      ),
    ),
  );
}
