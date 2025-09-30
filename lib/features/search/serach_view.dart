import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/search/controller/search_controller.dart';
import 'package:provider/provider.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SuggestionController(),
      child: Consumer<SuggestionController>(
        builder: (context, controller, _) {
          return Scaffold(
            backgroundColor: AppColors.background_color,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔍 Search Bar
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/icons/arrow_forward.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: AppColors.background_color,
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.white70, size: 20.sp),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    onChanged: controller.search, // 👈 Search trigger
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.white54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: controller.clearSearch, // 👈 Clear search
                                  child: Icon(Icons.close, color: Colors.white70, size: 20.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Suggestions',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 📋 Suggestion List
                    ...controller.suggestions.map((item) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.h),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProDisplay',
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
