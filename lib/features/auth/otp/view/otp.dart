import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/auth/otp/controller/otp_controller.dart';
import 'package:provider/provider.dart';

class Otppage extends StatelessWidget {
  const Otppage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.background_color,
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w,vertical:50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow_forward.svg',
                      width: 13.w,
                      height: 16.h,
                      // ignore: deprecated_member_use
                      color: AppTextColors.primary_color,
                    ),
                  ),
                  SizedBox(width: 150.w),
                  Text(
                    "OTP",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize:20.sp ,
                      fontWeight:FontWeight.w500 ,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              SizedBox(
              width: 150.01.w,
              height: 139.h,
              child: Image.asset(
                "assets/images/first_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height: 10.h),
            Text(
              "OTP",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: AppTextColors.primary_color,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "We have sent a 4-digit code to your email",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              OtpTextField(
                numberOfFields: 4,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                fieldHeight: 60.h,
                fieldWidth: 70.w,
                margin: EdgeInsets.symmetric(horizontal: 8),
                borderRadius: BorderRadius.circular(12),
                textStyle: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: AppTextColors.primary_color,
                ),
                onSubmit: (String code) {
                  final controller = Provider.of<OtpController>(context,listen: false,);
                  controller.otpController.text = code;
                },
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Request OTP',
                  onPressed: () async {
                    final email = Uri.decodeComponent(GoRouterState.of(context).uri.queryParameters['email'] ?? '',);
                    final controller = Provider.of<OtpController>(context,listen: false,);
                    final otp = controller.otpController.text.replaceAll(RegExp(r'\s+'), '',);
                    debugPrint("Entered OTP: $otp");
                    if (otp.length != 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a 4-digit OTP'),),);
                      return;
                    }
                    final isVerified = await controller.verifyOtpUser(email,otp,);
                    if (isVerified) {
                      final encodedEmail = Uri.encodeComponent(email);
                      context.push('/reset_password?email=$encodedEmail');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            controller.otpError ?? 'OTP verification failed',
                          ),
                        ),
                      );
                    }
                  }
                ),
              ),
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  text: "Backt to",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                    color: AppTextColors.primary_color,
                  ),
                  children: [
                    TextSpan(
                      text: ' Resend OTP',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                        color: AppTextColors.third_color, 
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //context.push('/login');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}