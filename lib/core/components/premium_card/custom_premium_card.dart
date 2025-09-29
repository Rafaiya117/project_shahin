import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class PremiumUpgradeCard extends StatelessWidget {
  final VoidCallback onPressed;

  const PremiumUpgradeCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.button_background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/premium_icon.svg',
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 10.w),
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
            onPressed: onPressed,
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
                color: AppTextColors.primary_color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
