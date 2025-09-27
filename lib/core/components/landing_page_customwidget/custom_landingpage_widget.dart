import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_shahin/core/utils/theme.dart';

class OnboardingCard extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String description;
  final int dotsCount;
  final double currentIndex;
  final String buttonText;
  final VoidCallback onNext;
  final String arrowIconPath;

  const OnboardingCard({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.description,
    this.dotsCount = 3,
    this.currentIndex = 0,
    this.buttonText = "Next",
    required this.onNext,
    this.arrowIconPath = "assets/icons/arrow_back.svg",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Background Image
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),

        /// Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF232D3B),
                  const Color(0xFF232D3B),
                  Colors.white.withOpacity(0.0),
                ],
                stops: const [0.0, 0.5, 1.2],
              ),
            ),
          ),
        ),

        /// Content
        Positioned.fill(
          top: 450,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),

                /// Description
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16.h),

                /// Dots + Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Dots
                    DotsIndicator(
                      dotsCount: dotsCount,
                      position: currentIndex,
                      decorator: const DotsDecorator(
                        color: Colors.white,
                        activeColor: AppColors.indigator_active,
                      ),
                    ),

                    /// Button
                    SizedBox(
                      width: 105.w,
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: onNext,
                        child: Row(
                          children: [
                            Text(
                              buttonText,
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            SvgPicture.asset(
                              arrowIconPath,
                              width: 14.w,
                              height: 8.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
