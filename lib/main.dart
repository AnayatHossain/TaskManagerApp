import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
      DevicePreview(
          builder: (context) =>
              TaskManagerApp()
      )
      );
}
