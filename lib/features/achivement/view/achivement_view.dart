import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/custom_widget/achivment_card.dart';

class AchivementView extends StatelessWidget {
  const AchivementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
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
                  "Achivements",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTextColors.primary_color,
                  ),
                ),
              ],
            ),
          SizedBox(height: 20.h,),
          AchievementBadge(
            title: "Tracker",
            description: "Log in for 7 consecutive days.",
            progress: 1.0,
            iconPath: "assets/icons/wolf.svg",
            initiallySelected: false,
            onTap: () {
              print("Tracker badge tapped!");
            },
          ),
          AchievementBadge(
            title: "Stalker",
            description: "Read 20 fitness motivation quotes.",
            progress: 0.45,
            iconPath: "assets/icons/wolf.svg",
            ),
          ],
        ),
      ),
    );
  }
}