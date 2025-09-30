import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/qoute_card/custom_qoute_card.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/favourite/controller/favourite_controller.dart';
import 'package:provider/provider.dart';

class FavouriteCollection extends StatelessWidget {
  const FavouriteCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouriteController(),
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child:SvgPicture.asset(
                      'assets/icons/arrow_forward.svg',
                      width: 13.w,
                      height: 16.h,
                      // ignore: deprecated_member_use
                      color: AppTextColors.primary_color,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Favorites",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Consumer<FavouriteController>(
                builder: (context, controller, _) {
                  return Column(
                    children: controller.quotes.map((quote) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: QuoteCard(
                          quoteText: quote.quoteText,
                          authorName: quote.authorName,
                          dateText: quote.dateText,
                          likeIconPath: "assets/icons/heart_two.svg",
                          commentIconPath: "assets/icons/share.svg",
                          shareIconPath: "assets/icons/bookmark.svg",
                          showActions: true,
                          onShare: () => controller.shareQuote(
                            quote.quoteText,
                            quote.authorName,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
