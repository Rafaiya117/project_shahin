
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/landing_page_customwidget/custom_landingpage_widget.dart';

class FirstLandingpage extends StatelessWidget {
  const FirstLandingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        backgroundImage: "assets/images/lan2.png",
        title: "Every Day. No Excuse",
        description:"Get brutal quotes every day. Alpha kills comfort and\n fuels your grind",
        dotsCount: 3,
        currentIndex: 0,
        buttonText: "Next",
        onNext: () {
          context.push('/second_landingpage');
        },
        arrowIconPath: "assets/icons/arrow_back.svg",
      ),
    );
  }
}