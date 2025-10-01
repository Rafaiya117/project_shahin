import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:project_shahin/core/components/qoute_card/custom_qoute_card.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/collection/controller/collection_controller.dart';
import 'package:project_shahin/features/collection/custom_widget/delete.dart';
import 'package:provider/provider.dart';

class MyCollection extends StatelessWidget {
  const MyCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteController(),
      child: Consumer<QuoteController>(
        builder: (context, controller, _) {
          return Scaffold(
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
                      Text("Collections", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppTextColors.primary_color)),
                      Spacer(),
                      GestureDetector(
                        onTap: () => controller.sortByRecent(), 
                        child: SvgPicture.asset('assets/icons/shorting.svg', width: 24.w, height: 24.h),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: (){
                          showDeletePopup(context);
                        }, 
                        child: SvgPicture.asset('assets/icons/menu.svg', width: 24.w, height: 24.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ...controller.quotes.map((quote) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: QuoteCard(
                        quoteText: quote.quoteText,
                        authorName: quote.authorName,
                        dateText: DateFormat('EEE, d MMMM yyyy').format(quote.createdAt),
                        likeIconPath: "assets/icons/heart.svg",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
