import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';

class ResetPassowrd extends StatelessWidget {
  const ResetPassowrd({super.key});

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
                    "Reset Password",
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
              "Reset Password?",
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
                    text: "Enter your new password below to reset your\n password",
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
                hintText: "Enter New Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true, 
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                hintText: "Enter Confirm Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true, 
              ),
            SizedBox(height: 30.h,),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
              text: 'Reset Password',
                onPressed: () {
                context.push('/profile');
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