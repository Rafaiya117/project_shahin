import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/components/qoute_card/custom_qoute_card.dart';
import 'package:project_shahin/core/utils/theme.dart';

class FavouriteCollection extends StatelessWidget {
  const FavouriteCollection({super.key});

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
                SvgPicture.asset(
                  'assets/icons/arrow_forward.svg',
                  width: 13.w,
                  height: 16.h,
                ),
                SizedBox(width: 20.w,),
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
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: true,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: true,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: true,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: true,
            ),
            SizedBox(height: 20.h,),
            QuoteCard(
              quoteText:"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
              dateText: "Sat, 20 September 2008",
              likeIconPath: "assets/icons/heart.svg",
              commentIconPath: "assets/icons/share.svg",
              shareIconPath: "assets/icons/bookmark.svg", 
              authorName: 'Steve Jobs',
              showActions: true,
            ),
          ],
        ),
      ),
    );
  }
}