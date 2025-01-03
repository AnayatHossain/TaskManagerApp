import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name = '/forgot-password/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Set Password', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text('A 6 digits of OTP has been sent to your email address ', style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500
                  )),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _newPasswordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'New Password'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Confirm New Password'),
                  ),

                  const SizedBox(height: 8),

                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.name);
                    },
                    child: const Text('Confirm'),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: _buildSignInSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          children: [
            TextSpan(
                text: 'Sign in',
                style: TextStyle(
                    color: AppColors.themeColor, fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (value) => false);
                })
          ]),
    );
  }
  @override
  void dispose() {
    _newPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }

}
