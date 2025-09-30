import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/custom_widget/custom_toogle_badge.dart';
import 'package:project_shahin/features/alpha_circle/controller/controller.dart';
import 'package:project_shahin/features/alpha_circle/widget/custom_user_card.dart';
import 'package:provider/provider.dart';

class AlphaFriendCircle extends StatelessWidget {
  const AlphaFriendCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlphaCircleController(),
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header + Toggles (unchanged)
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Alpha Circle\n",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTextColors.primary_color,
                          ),
                        ),
                        TextSpan(
                          text: "Complete with the best",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            // ignore: deprecated_member_use
                            color: AppTextColors.primary_color.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50.w),
                  Container(
                    width: 141.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.categorycard_color,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.button_background,
                        width: 1.w,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Invite Friends',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTextColors.primary_color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomToggleBar(
                items: [
                  ToggleItem(
                    label: "Global",
                    svgIcon: "assets/icons/trophy.svg",
                    onTap: () {
                      print("Badges clicked");
                
                    },
                  ),
                  ToggleItem(
                    label: "Friends",
                    svgIcon: "assets/icons/friend_circle.svg",
                    onTap: () {
                      print("Titles clicked");
                        context.push('/alpha_friend_circle');
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20.h),
              CustomToggleBar(
                items: [
                  ToggleItem(
                    label: "This Week",
                    svgIcon: "",
                    onTap: () {
                      print("Badges clicked");
                
                    },
                  ),
                  ToggleItem(
                    label: "This Month",
                    svgIcon: "",
                    onTap: () {
                      print("Titles clicked");
                        context.push('/titles');
                      },
                    ),
                    ToggleItem(
                    label: "All Time",
                    svgIcon: "",
                    onTap: () {
                      print("Titles clicked");
                        context.push('/titles');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Consumer<AlphaCircleController>(
                builder: (context, controller, _) {
                  return Column(
                    children: List.generate(controller.users.length, (index) {
                      final user = controller.users[index];
                      return UserCard(
                        rank: user.rank,
                        imageUrl: user.imageUrl,
                        name: user.name,
                        role: user.role,
                        level: user.level,
                        points: user.points,
                        isSelected: user.isSelected,
                        onTap: () => controller.selectUser(index),
                        iconPath: user.iconPath,
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
