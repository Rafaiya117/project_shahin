import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/custom_category_card/custom_category_card.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/category/controller/category_controller.dart';
import 'package:provider/provider.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryController(),
      child: Consumer<CategoryController>(
        builder: (context, controller, _) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background_color,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/arrow_forward.svg',
                            width: 13.w,
                            height: 16.h,
                            // ignore: deprecated_member_use
                            color: AppTextColors.primary_color,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "Select Categories",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTextColors.primary_color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Every Alpha has a target",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTextColors.primary_color,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "What's your?",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: AppTextColors.primary_color,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ...List.generate(controller.categories.length, (index) {
                      final category = controller.categories[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: CategoryCard(
                          iconPath: category.iconPath,
                          title: category.title,
                          subtitle: category.subtitle,
                          isSelected: category.isSelected,
                          onTap: () => controller.toggleSelection(index),
                        ),
                      );
                    }),
                    SizedBox(height: 30.h),
                    Center(
                      child: Text(
                        "${controller.selectedCount} of ${controller.categories.length} categories selected",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppTextColors.primary_color,
                        ),
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
        },
      ),
    );
  }
}
