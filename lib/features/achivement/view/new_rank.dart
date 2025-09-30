import 'package:flutter/material.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/achivement/controller/achivement_controller.dart';
import 'package:provider/provider.dart';

class NewRankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/hunter_two.png', 
                height: 250,
                width: 250,
              ),
              SizedBox(height: 10),
              Text(
                'New Rank Unlocked!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Hunter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'You\'ve achieved a new milestone and earned\na special badge.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              _buildShareAchievementButton(),
              SizedBox(height: 15),
              _buildContinueButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShareAchievementButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: Consumer<AchivementController>(builder: (child, controller,_){
        return ElevatedButton(
        onPressed: () {
         controller.shareQuote(
            "I just unlocked a new rank: Hunter! 🏆 #AchievementUnlocked",
            "Shivted"
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Share Achievement',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      })
    );
  }

  Widget _buildContinueButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: () {
          // Handle Continue
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[700]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}