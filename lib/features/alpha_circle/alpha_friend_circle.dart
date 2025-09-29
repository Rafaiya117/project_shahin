import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/custom_widget/custom_toogle_badge.dart';
import 'package:project_shahin/features/alpha_circle/widget/custom_user_card.dart';

class AlphaFriendCircle extends StatelessWidget {
  const AlphaFriendCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.background_color,
    body: Center(
      child: Padding(
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
              UserCard(
                rank: 2,
                imageUrl:'https://via.placeholder.com/150', 
                name: 'David Lee',
                role: 'Hunter', 
                level: 10,
                points: 800,
              ),
              UserCard(
                rank: 3,
                imageUrl:'https://via.placeholder.com/150/FF0000/FFFFFF?text=A', 
                name: 'Alice Smith',
                role: 'Warrior', 
                level: 8,
                points: 750,
              ),
              UserCard(
                rank: 4,
                imageUrl:'https://via.placeholder.com/150/0000FF/FFFFFF?text=B', 
                name: 'Bob Jones',
                role:'Engineer', 
                level: 5,
                points: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}