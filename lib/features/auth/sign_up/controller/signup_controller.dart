import 'package:flutter/widgets.dart';

class SignupController extends ChangeNotifier{
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

    bool areFieldsFilled(List<TextEditingController> controllers) {
    for (final controller in controllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool validateSignupFields() {
    return areFieldsFilled([emailController, nameController, passwordController]);
  }
}