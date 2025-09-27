import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/landing_page_customwidget/prograss_indigator_widget.dart';
import 'package:project_shahin/core/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.push('/first_landingpage');
    });
  }

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
        child:Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.w,vertical: 200.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 273.w,
                  height: 233.h,
                  child: Image.asset(
                    "assets/images/first_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "ALPHA",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                    color: AppTextColors.third_color,
                  ),
                ),
                Text(
                  "Motivation",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTextColors.primary_color,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 34.w,
                  child: ProgressIndicatorWidget(
                    barHeight: 4,
                    percentage: 100,
                    progressColor: AppColors.indigator_active,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
