import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool hasBorder;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hasBorder = true,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'SFProDisplay',
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppTextColors.primary_color,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: fillColor != null,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: hasBorder
              ? BorderSide(
                  color: AppColors.button_background,
                  width: 1.5,
                )
              : BorderSide.none, // keeps radius even without visible border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: hasBorder
              ? BorderSide(
                  color: AppColors.button_background,
                  width: 1.5,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: hasBorder
              ? BorderSide(
                  color: AppColors.button_background,
                  width: 1.5,
                )
              : BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 15.w,
            height: 15.h,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
