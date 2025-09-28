import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/custom_category_card/custom_category_card.dart';
import 'package:project_shahin/core/utils/theme.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.background_color,
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 100.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Every Alpha has a target",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTextColors.primary_color,
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What's your?",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppTextColors.primary_color,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CategoryCard(
                iconPath: 'assets/icons/fitness_icon.svg',
                title: 'Fitness',
                subtitle: 'Conquer My Body',
                onTap: () {
                  // Navigate or trigger action
                },
              ),
              SizedBox(height: 10.h,),
              CategoryCard(
                iconPath: 'assets/icons/career_icon.svg',
                title: 'Career',
                subtitle: 'Crash My Career',
                onTap: () {
                  // Navigate or trigger action
                },
              ),
              SizedBox(height: 10.h,),
              CategoryCard(
                iconPath: 'assets/icons/bussiness_icon.svg',
                title: 'Business',
                subtitle: 'Build My Empire',
                onTap: () {
                  // Navigate or trigger action
                },
              ),
              SizedBox(height: 10.h,),
              CategoryCard(
                iconPath: 'assets/icons/discipline_icon.svg',
                title: 'Discipline',
                subtitle: 'Master My Discipline',
                onTap: () {
                  // Navigate or trigger action
                },
              ),
              SizedBox(height: 10.h,),
              CategoryCard(
                iconPath: 'assets/icons/mindset_icon.svg',
                title: 'Mindset',
                subtitle: 'Forge an Unbreakable Mindset',
                onTap: () {
                  // Navigate or trigger action
                },
              ),
              SizedBox(height: 30.h),
              Text(
                "0 of 5 categories selected",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: AppTextColors.primary_color
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Continue',
                  onPressed: () {
                    context.push('/signin-signup_option');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}