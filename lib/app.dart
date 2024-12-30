import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_otp_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
          colorSchemeSeed: AppColors.themeColor,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            fillColor: Colors.white,
            hintStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16)))),
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if (setting.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (setting.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (setting.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (setting.name == ForgotPasswordVerifyEmailScreen.name) {
          widget = const ForgotPasswordVerifyEmailScreen();
        } else if (setting.name == ForgotPasswordVerifyOtpScreen.name) {
          widget = const ForgotPasswordVerifyOtpScreen();
        } else if (setting.name == ResetPasswordScreen.name) {
          widget = const ResetPasswordScreen();
        } else if (setting.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (setting.name == AddNewTaskScreen.name) {
          widget = const AddNewTaskScreen();
        }

        return MaterialPageRoute(builder: (ctx) => widget);
      },
    );
  }
}
