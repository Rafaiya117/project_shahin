import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
          padding:EdgeInsets.symmetric(horizontal: 16.w,vertical:30),
          child: Column(
            children: [
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
              "Wellcome Back, Wolf",
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
                    text: "Your streak awaits. Stay consistence.\n",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Center(
                      child: Text(
                        "Alpha",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppTextColors.primary_color,
                          ),
                        ),
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
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: "Enter Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true, 
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    context.push('/forgot_password');
                  }, 
                  child: Text(
                    "Forget Passoword?",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10.h,),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
              text: 'Sign In',
                onPressed: () {
                    context.push('/home');
                },
                  backgroundColor: AppColors.button_background,
                  textColor: AppTextColors.secondary_color,
                  //borderColor: Colors.black,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                      endIndent: 12,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                      indent: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Continue with Apple',
                  onPressed: () {
                    context.push('/');
                  },
                  backgroundColor: AppColors.background_color,
                  textColor: AppTextColors.primary_color,
                  borderColor: AppColors.button_background,
                  svgIconPath: 'assets/icons/apple_icon.svg',
                ),
              ),
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                    color: AppTextColors.primary_color,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                        color: AppTextColors.third_color, 
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/signup');
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