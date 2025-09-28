import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/utils/theme.dart';

class SigninSignup extends StatelessWidget {
  const SigninSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.background_color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 273.w,
              height: 233.h,
              child: Image.asset(
                "assets/images/first_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height: 10.h),
            Text(
              "ALPHA",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
                color: AppTextColors.third_color,
              ),
            ),
            Text(
              "Motivation",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppTextColors.primary_color,
              ),
            ),
          SizedBox(height: 30.h,),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: 'Sign In',
              onPressed: () {
                context.push('/login');
                },
              backgroundColor: AppColors.button_background,
              textColor: AppTextColors.secondary_color,
              //borderColor: Colors.black,
              ),
            ),
          SizedBox(height: 20.h,),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: 'Sign Up',
              onPressed: () {
                context.push('/signup');
                },
              backgroundColor: AppColors.background_color,
              textColor: AppTextColors.primary_color,
              borderColor: AppColors.button_background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}