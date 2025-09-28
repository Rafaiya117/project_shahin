import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';

class ForgotPassowrd extends StatelessWidget {
  const ForgotPassowrd({super.key});

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
                  SvgPicture.asset(
                    'assets/icons/arrow_forward.svg',
                    width: 13.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 100.w,),
                  Text(
                    "Forgot Password",
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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Enter your email address and we'll send you a\n verify code to reset your password",
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
              CustomTextField(
                hintText: "Enter Email Address",
                iconPath: "assets/icons/email_icon.svg",
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  // handle change
                },
              ),
              
            SizedBox(height: 30.h,),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
              text: 'Request OTP',
                onPressed: () {
                  context.push('/otp_page');
                },
                  backgroundColor: AppColors.button_background,
                  textColor: AppTextColors.secondary_color,
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
                      text: ' Sign IN',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                        color: AppTextColors.third_color, 
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/login');
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