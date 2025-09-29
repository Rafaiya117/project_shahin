import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/custom_widget/achivment_card.dart';
import 'package:project_shahin/features/achivement/custom_widget/custom_toogle_badge.dart';

class AchivementView extends StatelessWidget {
  const AchivementView({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.background_color,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/arrow_forward.svg',
                width: 13.w,
                height: 16.h,
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
          //SizedBox(height: 10.h),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, 
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.8, 
              children: [
                AchievementBadge(
                  title: "Lone Wolf",
                  description: "Complete 5 morning motivation sessions",
                  progress: 1.0,
                  iconPath: "assets/images/lone.png",
                  initiallySelected: false,
                  onTap: () {
                    print("Lone Wolf badge tapped!");
                  },
                ),
                AchievementBadge(
                  title: "Tracker",
                  description: "Log in for 7 consecutive days.",
                  progress: 0.45,
                  iconPath: "assets/images/tracker.png", 
                ),
                AchievementBadge(
                  title: "Hunter",
                  description: "Complete 5 morning motivation sessions",
                  progress: 1.0,
                  iconPath: "assets/images/hunter.png",
                  initiallySelected: false,
                  onTap: () {
                    print("Lone Wolf badge tapped!");
                  },
                ),
                AchievementBadge(
                  title: "Stalker",
                  description: "Log in for 7 consecutive days.",
                  progress: 0.45,
                  iconPath: "assets/images/stalker.png", 
                ),
                AchievementBadge(
                  title: "Pack Wolf",
                  description: "Complete 5 morning motivation sessions",
                  progress: 1.0,
                  iconPath: "assets/images/pack.png",
                  initiallySelected: false,
                  onTap: () {
                    print("Lone Wolf badge tapped!");
                  },
                ),
                AchievementBadge(
                  title: "Enforcer",
                  description: "Log in for 7 consecutive days.",
                  progress: 0.45,
                  iconPath: "assets/images/enforce.png", 
                ),
                AchievementBadge(
                  title: "Beta Wolf",
                  description: "Complete 5 morning motivation sessions",
                  progress: 1.0,
                  iconPath: "assets/images/beta.png",
                  initiallySelected: false,
                  onTap: () {
                    print("Lone Wolf badge tapped!");
                  },
                ),
                AchievementBadge(
                  title: "Silver Alpha",
                  description: "Log in for 7 consecutive days.",
                  progress: 0.45,
                  iconPath: "assets/images/silver.png", 
                ),
                AchievementBadge(
                  title: "Shadow Alpha",
                  description: "Complete 5 morning motivation sessions",
                  progress: 1.0,
                  iconPath: "assets/images/shadow.png",
                  initiallySelected: false,
                  onTap: () {
                    print("Lone Wolf badge tapped!");
                  },
                ),
                AchievementBadge(
                  title: "Shadow Alpha",
                  description: "Log in for 7 consecutive days.",
                  progress: 0.45,
                  iconPath: "assets/images/alpha.png", 
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}