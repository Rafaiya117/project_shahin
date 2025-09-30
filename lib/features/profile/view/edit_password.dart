import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 40.h),
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
                    width: 16.w,
                    height: 16.h,
                    color: AppTextColors.primary_color,
                  ),
                ),
                SizedBox(width: 20.w),
                  Text(
                    "Edit Password",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize:20.sp ,
                      fontWeight:FontWeight.w500 ,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              decoration: BoxDecoration(
                color: AppColors.categorycard_color,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
              children: [
              CustomTextField(
                hintText: "Enter Current Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true, 
                hasBorder: false,
                fillColor: AppColors.background_color,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                hintText: "Enter New Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true,
                hasBorder: false,
                fillColor: AppColors.background_color, 
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                hintText: "Re-Enter New Password",
                iconPath: "assets/icons/password_icon.svg",
                controller: TextEditingController(),
                obscureText: true,
                hasBorder: false,
                fillColor: AppColors.background_color, 
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            text: 'Save',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.categorycard_color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        'Success',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                      content: Text(
                        'Your password has been updated.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                              // Optionally navigate to profile
                              context.pop();
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTextColors.primary_color,
                                fontFamily: 'SFProDisplay',
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              backgroundColor: AppColors.button_background,
              textColor: AppTextColors.secondary_color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}