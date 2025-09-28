import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final String? svgIconPath; // Optional SVG icon path
  final double iconSize;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor,
    this.svgIconPath,
    this.iconSize = 20, // Default icon size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 1.5)
              : BorderSide.none,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (svgIconPath != null) ...[
            SvgPicture.asset(
              svgIconPath!,
              width: iconSize.w,
              height: iconSize.h,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8.w),
          ],
          Text(
            text,
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
