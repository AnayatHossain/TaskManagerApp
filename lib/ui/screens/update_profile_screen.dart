import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: TMAppBar(
          formUpdateProfile: true,
        ),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text('Update Profile', style: textTheme.titleLarge),
                      const SizedBox(height: 24),
                      _buildPhotoPicker(),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _firstNameTEController,
                        decoration:
                            const InputDecoration(hintText: 'First Name'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _lastNameTEController,
                        decoration:
                            const InputDecoration(hintText: 'Last Name'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _mobileTEController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: 'Mobile'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordTEController,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: 'Password'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget _buildPhotoPicker() {
    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                            ),
                            alignment: Alignment.center,
                            child: Text('Photo'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'No item selected',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _lastNameTEController.dispose();
    _firstNameTEController.dispose();
    _mobileTEController.dispose();
    super.dispose();
  }
}
