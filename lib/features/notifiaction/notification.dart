import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/qoute_card/custom_qoute_card.dart';
import 'package:project_shahin/core/utils/theme.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    width: 24.w,
                    height: 24.h,
                    color: AppTextColors.primary_color,
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTextColors.primary_color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: false,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: false,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: false,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: false,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: false,
            ),
          ],
        ),
      ),
    );
  }
}