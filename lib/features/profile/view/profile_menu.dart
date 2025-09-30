import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/profile_menu/profile_menu_card.dart';
import 'package:project_shahin/core/utils/theme.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color, 
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Profile",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize:20.sp ,
                      fontWeight:FontWeight.w500 ,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
            // Profile Info
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.grey.shade800,
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(
                      'assets/images/profile_pic.png',
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alex Smith',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'alex@example.com',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5.h),
                     Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            //vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.button_background,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            'Level 3',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppTextColors.secondary_color,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '1920 pts',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            // Upgrade Prompt
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.button_background,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/premium_icon.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 10.w,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Upgrade to Premium\n',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppTextColors.secondary_color,
                            fontFamily: 'SFProDisplay',
                          ),
                        ),
                        TextSpan(
                          text: 'Unlock all features',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: AppTextColors.secondary_color,
                            fontFamily: 'SFProDisplay',
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 12.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.homepage_background,
                      foregroundColor: AppColors.button_background,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      'Upgrade',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTextColors.primary_color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            // Menu Options
            ProfileMenuItem(
              svgIconPath:'assets/icons/profile_user.svg' ,
              label: 'Edit Profile',
              onTap: () {
                context.push('/edit_profile');
              },
            ),
             ProfileMenuItem(
              svgIconPath:'assets/icons/profile_premium.svg' ,
              label: 'Subscription',
              onTap: () {
                context.push('/subscription_page');
              },
            ),
            ProfileMenuItem(
              svgIconPath: 'assets/icons/notification.svg',
              label: 'Notification',
              onTap: () {
                context.push('/general_notification');
              },
            ),
            ProfileMenuItem(
              svgIconPath: 'assets/icons/setting_icon.svg',
              label: 'Settings',
              onTap: () {
                context.push('/settings');
              },
            ),
            SizedBox(height: 100.h,),
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Logout',
                onPressed: () {
                  //context.push('/');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: AppColors.categorycard_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                             border: Border.all(
                                color: Colors.white, 
                                width: 1.5, 
                              ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:'Are you sure you want to log out of your\n',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white70,
                                          fontFamily: 'SFProDisplay',
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'account?',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white70,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Cancel Button
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.h,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.r,),
                                          ),
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    // Log Out Button
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                         context.push('/login');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(vertical: 12.h,),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.r,),
                                          ),
                                        ),
                                        child: Text(
                                          'Log Out',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                backgroundColor: AppColors.background_color,
                textColor: AppTextColors.primary_color,
                borderColor: AppColors.button_background,
                svgIconPath: 'assets/icons/logout.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}