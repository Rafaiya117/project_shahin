import 'package:flutter/widgets.dart';
import 'package:project_shahin/features/auth/auth_services/auth_services.dart';

// inside OtpController
class OtpController extends ChangeNotifier {
  final otpController = TextEditingController();
  final AuthService _authService = AuthService();
  String? otpError;
  void disposeControllers() {
    otpController.dispose();
  }

  bool areFieldsFilled(List<TextEditingController> controllers) {
    for (final controller in controllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool validateOtpField() {
    return areFieldsFilled([otpController]);
  }

  // <-- new function to call verifyOtp
 Future<bool> verifyOtpUser(String email, String otp) async {
  try {
    final response = await _authService.verifyOtp(email, otp);
    if (response['success'] == true) {
      return true;
    } else {
      otpError = response['error'] ?? response['message'];
      debugPrint("OTP error: $otpError");
      return false;
    }
  } catch (e) {
    debugPrint("OTP exception: $e");
    otpError = 'Something went wrong. Please try again.';
    return false;
  }
}

}
