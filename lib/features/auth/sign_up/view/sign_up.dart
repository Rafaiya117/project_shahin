import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/auth/login/controller/login_controller.dart';
import 'package:project_shahin/features/auth/sign_up/controller/signup_controller.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUp = Provider.of<SignupController>(context, listen: false);
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
              "Create Account",
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
                    text: "Start your streak. Displine begins here",
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
                hintText: "Enter Full Name",
                iconPath: "assets/icons/user_icon.svg",
                controller: SignUp.nameController,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  // handle change
                },
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hintText: "Enter Email Address",
                iconPath: "assets/icons/email_icon.svg",
                controller: SignUp.emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  // handle change
                },
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: "Enter Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: SignUp.passwordController,
                obscureText: true, 
              ),
            SizedBox(height: 30.h,),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
              text: 'Sign Up',
                onPressed: () async {
                  if (SignUp.validateSignupFields()) {
                    final success = await SignUp.signupUser();
                      if (success) {
                        if (context.mounted) context.push('/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              SignUp.signupError ?? 'Signup failed',
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in all fields"),
                        ),
                      );
                    }
                  },
                  backgroundColor: AppColors.button_background,
                  textColor: AppTextColors.secondary_color,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      // ignore: deprecated_member_use
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
                    context.push('/login');
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
                  text: "Already have an account?",
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
                        ..onTap = () {},
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