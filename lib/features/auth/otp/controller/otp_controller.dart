import 'package:flutter/widgets.dart';

class OtpController extends ChangeNotifier{
  final otpController = TextEditingController();

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
}