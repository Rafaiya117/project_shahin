import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String svgIconPath;
  final String label;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.svgIconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.categorycard_color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(
                svgIconPath,
                width: 24.w,
                height: 24.h,
                color: Colors.white,
              ),
              SizedBox(width: 16.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                width: 13.w,
                height: 16.h,
                color: AppColors.button_background,
              ),
            ],
          ),
        ),
      ),
    );
  }
}