import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/profile_menu/profile_menu_card.dart';
import 'package:project_shahin/core/utils/theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
                  SvgPicture.asset(
                    'assets/icons/arrow_forward.svg',
                    width: 13.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 20.w,),
                  Text(
                    "Settings",
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
              Column(
                children: [
                  ProfileMenuItem(
                  svgIconPath: 'assets/icons/help&support.svg',
                  label: 'Help & Support',
                  onTap: () {
                    context.push('/help_support');
                  },
                ),
                ProfileMenuItem(
                  svgIconPath: 'assets/icons/termsCondition.svg',
                  label: 'Terms & Condition',
                  onTap: () {
                    context.push('/terms');
                  },
                ),
                ProfileMenuItem(
                  svgIconPath: 'assets/icons/privacy_policy.svg',
                  label: 'Privacy Policy',
                  onTap: () {
                    context.push('/privacy');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}