import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/landing_page_customwidget/custom_landingpage_widget.dart';

class SecondLandingPage extends StatelessWidget {
  const SecondLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        backgroundImage: "assets/images/lan1.png",
        title: "Join the Alpha Circle",
        description:"Climb the ranks like a wolf,Even badges, Unlock\ntitles.Prove dominance",
        dotsCount: 3,
        currentIndex: 1,
        buttonText: "Next",
        onNext: () {
         context.push('/third_landingpage');
        },
        arrowIconPath: "assets/icons/arrow_back.svg",
      ),
    );
  }
}