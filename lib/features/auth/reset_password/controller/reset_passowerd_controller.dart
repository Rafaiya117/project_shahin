import 'package:flutter/widgets.dart';
import 'package:project_shahin/features/auth/auth_services/auth_services.dart';

class ResetPassowerdController extends ChangeNotifier {
  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();
  final AuthService _authService = AuthService(); 

  String? errorMessage; 

  void disposeControllers() {
    passwordController.dispose();
    confirm_passwordController.dispose();
  }

  //!------------input validation -------------!
  bool areFieldsFilled(List<TextEditingController> controllers) {
    for (final controller in controllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool validateLoginFields() {
    return areFieldsFilled([passwordController, confirm_passwordController]);
  }

  //!------------reset password call -------------!
  Future<bool> resetPassword(String email) async {
    try {
      final response = await _authService.resetPassword(
        email,
        passwordController.text.trim(),
        confirm_passwordController.text.trim(),
      );

      debugPrint("Reset password response: $response");

      if (response['success'] == true) {
        errorMessage = null;
        return true;
      } else {
        errorMessage = response['error'] ?? response['message'] ?? 'Reset failed';
        return false;
      }
    } catch (e) {
      debugPrint("Reset password exception: $e");
      errorMessage = 'Something went wrong. Please try again.';
      return false;
    }
  }
}
