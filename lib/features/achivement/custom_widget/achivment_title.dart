import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class AchievementTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String points;
  final String iconPath;
  final VoidCallback? onTap;

  const AchievementTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.points,
    required this.iconPath,
    this.onTap,
  });

  @override
  State<AchievementTile> createState() => _AchievementTileState();
}

class _AchievementTileState extends State<AchievementTile> {
  bool isSelected = false; // ✅ selection state inside the widget

  void _handleTap() {
    setState(() {
      isSelected = !isSelected; // toggle selection
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.categorycard_color,
          border: isSelected
              ? Border.all(color: Colors.white, width: 2)
              : null, // ✅ White border when selected
        ),
        child: Row(
          children: [
            // ✅ Title + Subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTextColors.primary_color,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppTextColors.primary_color,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ✅ Points + Icon aligned right
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.points,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTextColors.primary_color,
                  ),
                ),
                SizedBox(height: 4.h),
                SvgPicture.asset(
                  widget.iconPath,
                  width: 10.w,
                  height: 12.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
