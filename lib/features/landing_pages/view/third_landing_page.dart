import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/landing_page_customwidget/custom_landingpage_widget.dart';

class ThirdLandingPage extends StatelessWidget {
  const ThirdLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        backgroundImage: "assets/images/lan4.png",
        title: "From Quotes to Power",
        description:"Each badge marks growth, Each title proves strength,\nAlpha forges your unbreakable mindset                ",
        dotsCount: 3,
        currentIndex: 2,
        buttonText: "Next",
        onNext: () {
          context.push('/select_category_page');
        },
        arrowIconPath: "assets/icons/arrow_back.svg",
      ),
    );
  }
}