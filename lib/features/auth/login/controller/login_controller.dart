import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_shahin/core/utils/theme.dart';

class LoginController extends ChangeNotifier{
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  // String? validateInput(TextEditingController controller, {required String fieldName}) {
  //   final value = controller.text.trim();
  //   if (value.isEmpty) {
  //     return '$fieldName cannot be empty';
  //   }
  //   return null;
  // }

  // void validateAllInputs(BuildContext context) {
  //   final emailError = validateInput(emailController, fieldName: 'Email');
  //   final nameError = validateInput(nameController, fieldName: 'Name');
  //   final passwordError = validateInput(passwordController, fieldName: 'Password');

  //   final errorMessage = emailError ?? nameError ?? passwordError;

  //   if (errorMessage != null) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         backgroundColor: AppColors.categorycard_color,
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //         title: Text(
  //           'Validation Error',
  //           style: TextStyle(
  //             fontSize: 18.sp,
  //             fontWeight: FontWeight.w600,
  //             color: Colors.white,
  //             fontFamily: 'SFProDisplay',
  //           ),
  //         ),
  //         content: Text(
  //           errorMessage,
  //           style: TextStyle(
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w400,
  //             color: Colors.white70,
  //             fontFamily: 'SFProDisplay',
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text(
  //               'OK',
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.w500,
  //                 color: AppTextColors.primary_color,
  //                 fontFamily: 'SFProDisplay',
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     // Proceed with save or navigation
  //     // context.push('/profile'); or notifyListeners();
  //   }
  // }

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
}