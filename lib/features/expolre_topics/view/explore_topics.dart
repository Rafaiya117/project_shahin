import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/premium_card/custom_premium_card.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/expolre_topics/custom_widget/custom_explore_card.dart';

class ExploreTopics extends StatelessWidget {
  const ExploreTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homepage_background,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.background_color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// --- Header Row ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/arrow_forward.svg',
                          width: 13.w,
                          height: 16.h,
                        ),
                        Text(
                          "Explore Topics",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTextColors.primary_color,
                          ),
                        ),
                        GestureDetector(
                          onTap:() {
                            context.push('/search');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            width: 13.w,
                            height: 16.h,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    /// --- Premium Card ---
                    PremiumUpgradeCard(onPressed: () {}),

                    SizedBox(height: 24.h),

                    /// --- Favorite Cards in Grid (max 2 per row) ---
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2, 
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 1.4, 
                        children: [
                          FavoriteCard(
                            text: "My\nFavorites",
                            svgIconPath: "assets/icons/heart.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.pinkAccent,
                            onTap: () {
                              print("Favorites tapped!");
                              context.push('/favorite');
                            },
                          ),
                          FavoriteCard(
                            text: "My\nCollections",
                            svgIconPath: "assets/icons/bookmark.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.blueAccent,
                            onTap: () {
                              context.push('/my_collection');
                            },
                          ),
                          FavoriteCard(
                            text: "My\nAchievements",
                            svgIconPath: "assets/icons/achivement_badge.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.amber,
                            onTap: () {
                              context.push('/achivment');
                            },
                          ),
                          FavoriteCard(
                            text: "Notification",
                            svgIconPath: "assets/icons/notification.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.greenAccent,
                            onTap: () {
                              context.push('/notification');
                            },
                          ),
                          FavoriteCard(
                            text: "Category",
                            svgIconPath: "assets/icons/grid.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.orangeAccent,
                            onTap: () {
                              context.push('/select_category_page');
                            },
                          ),
                          FavoriteCard(
                            text: "History",
                            svgIconPath: "assets/icons/history.svg",
                            initialIconColor: Colors.white,
                            tappedIconColor: Colors.tealAccent,
                            onTap: () {
                              context.push('/history');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
