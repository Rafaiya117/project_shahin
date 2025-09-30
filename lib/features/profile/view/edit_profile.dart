import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/utils/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: SingleChildScrollView( // ✅ Added scroll view
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h), 
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
                    "Edit Profile",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: AppColors.categorycard_color,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    // Profile Image
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage: AssetImage('assets/images/profile_pic.png'),
                          backgroundColor: AppColors.button_background,
                        ),
                        Positioned(
                          right: -4.w,
                          top: 50.r,
                          child: GestureDetector(
                            onTap: () {
                              // Handle camera tap
                            },
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/camera_icon.svg',
                                width: 3.w,
                                height: 3.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    // Name Row
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.background_color,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/user_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Alex Smith',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Email Row
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.background_color,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/email_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded( // ✅ Fix for unbounded width
                            child: TextField(
                              controller: TextEditingController(text: 'alex@example.com'),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                                fontFamily: 'SFProDisplay',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.categorycard_color,
                  border: Border.all(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/key_icon.svg',
                          width: 20.w,
                          height: 20.h,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/edit_password');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background_color,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Save',
                  onPressed: () {
                    // context.push('/profile');
                  },
                  backgroundColor: AppColors.button_background,
                  textColor: AppTextColors.secondary_color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
