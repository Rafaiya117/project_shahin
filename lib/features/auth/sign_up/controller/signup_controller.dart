import 'package:flutter/widgets.dart';
import 'package:project_shahin/features/auth/auth_services/auth_services.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final dob = '';
  final AuthService _authService = AuthService(); 
  String? signupError; 

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


  Future<bool> signupUser() async {
  try {
    final response = await _authService.signup(
      emailController.text.trim(),
      passwordController.text.trim(),
      nameController.text.trim(),
      dob, 
    );

    debugPrint("Signup response: $response");

    if (response['success'] == true) {
      signupError = null; 
      return true;      
    } else {
      final error = response['error'] ?? response['message'];
      signupError = (error != null ? error.toString() : 'Signup failed');
      debugPrint("Signup error: $signupError");
      return false;
    }
  } catch (e) {
    debugPrint("Signup exception: $e");
    signupError = 'Something went wrong. Please try again.';
    return false;
  }
}
}
