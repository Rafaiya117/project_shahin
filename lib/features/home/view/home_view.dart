import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/home_icons/home_icons.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/home/controller/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController controller = HomeController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final model = controller.model;

    return Scaffold(
      backgroundColor: AppColors.homepage_background,
      body: SafeArea(
        child: Stack(
          children: [
            // Quote in center
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.quote,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model.author,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 100.h,),
                    IconRow(
                      onHeartTap: () {
                        controller.points.value += 10; 
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Top-right points icon
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: controller.points,
                    builder: (context, value, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4,),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Color(0xFF414141).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/points.svg',
                              width: 12.w,
                              height: 11.h,
                            ),
                            SizedBox(width: 4.w,),
                            Text(
                              "$value pts",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Bottom navigation bar (custom style)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    GestureDetector(
                      onTap: () {
                        context.push('/expolre_topics');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/home_menu_icon.svg',
                        width: 40.w,
                        height: 40.h,                    
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/home_bar_icon.svg',
                        width: 40.w,
                        height:40.h,                    
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/profile_icon.svg',
                        width: 40.w,
                        height: 40.h,                    
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
