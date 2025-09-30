import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/custom_widget/achivment_title.dart';
import 'package:project_shahin/features/achivement/custom_widget/custom_toogle_badge.dart';

class AchivmentTitleView extends StatelessWidget {
  const AchivmentTitleView({super.key});

  @override
   @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.background_color,
    body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child:SvgPicture.asset(
                      'assets/icons/arrow_forward.svg',
                      width: 13.w,
                      height: 16.h,
                      // ignore: deprecated_member_use
                      color: AppTextColors.primary_color,
                    ),
                    ),
                  SizedBox(width: 20.w),
                  Text(
                    "Achievements",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "Track your progress",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTextColors.primary_color,
                ),
              ),
              SizedBox(height: 10.h),
              CustomToggleBar(
                  items: [
                    ToggleItem(
                      label: "Badges",
                      svgIcon: "assets/icons/badge.svg",
                      onTap: () {
                        print("Badges clicked");
                
                      },
                    ),
                    ToggleItem(
                      label: "Titles",
                      svgIcon: "assets/icons/title.svg",
                      onTap: () {
                        print("Titles clicked");
                          context.push('/titles');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Lone Wolf",
                  subtitle: "Reached Level 1",
                  points: "1000 Points",
                  iconPath: '',
                  onTap: () {
                    //print("Tile tapped");
                    context.push('/new_rank');
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
                SizedBox(height: 10.h),
                AchievementTile(
                  title: "Tracker",
                  subtitle: "Reached Level ",
                  points: "1000 Points",
                  iconPath: 'assets/icons/password_icon.svg',
                  onTap: () {
                    print("Tile tapped");
                  },
                ),
              ],
            ),
        ),
        ),
      ),
    );
  }
}