import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';

class PremiumUpgradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E2129),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Alpha',
          style: TextStyle(
            color: AppTextColors.primary_color,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProDisplay',
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Motivation',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upgrade to Premium unlock unlimited motivational power',
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildFeatureContainer(
                    title: 'Free',
                    features: [
                      'Limited quotes per day',
                      '1 daily notification',
                      'No leaderboard access',
                      'No badges unlocked',
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildFeatureContainer(
                    title: 'Premium',
                    isPremium: true,
                    features: [
                      'Unlimited Quotes',
                      'Customizable push notifications (5–10/ day)',
                      'Full Leaderboard access (Alpha Circle)',
                      'Exclusive badges & priority support',
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'why Upgrade ? One quote a day keeps you moving. Unlimited\nquotes, streaks, badges, and the Alpha Circle turn you\nunstoppable. Upgrade and lead. Wolves don\'t settle for less.',
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30),
            _buildPremiumSubscriptionSection(context),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildSubscriptionOption(
                    title: 'Monthly',
                    price: '\$4.99',
                    description: 'Billed every month',
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildSubscriptionOption(
                    title: 'Yearly',
                    price: '\$39.99',
                    description: 'Best value — save 33%',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: _buildSubscriptionOption(
                title: 'One-time',
                price: '\$89',
                description: 'Lifetime access\n(web only)',
                isCentered: true,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureContainer({
    required String title,
    required List<String> features,
    bool isPremium = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPremium? AppColors.categorycard_color:AppColors.background_color,
        borderRadius: BorderRadius.circular(12),
        border:Border.all(color: AppColors.button_background, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              //color: isPremium ? Color(0xFF8E8E92) : Colors.white,
              color: AppTextColors.primary_color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 8, color:AppTextColors.primary_color),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        color: AppTextColors.primary_color,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumSubscriptionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.categorycard_color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.button_background, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Premium',
                style: TextStyle(
                  color: AppTextColors.primary_color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$4.99',
                    style: TextStyle(
                      color: AppTextColors.primary_color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'per month',
                    style: TextStyle(
                      color: AppTextColors.primary_color,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'For those who refuse limits.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20),
          _buildPremiumFeatureRow(
            icon: 'assets/icons/flash.svg',
            title: 'Unlimited Quotes',
            subtitle: 'Daily hand-delivered to your categories',
          ),
          SizedBox(height: 15),
          _buildPremiumFeatureRow(
            icon: 'assets/icons/notification.svg',
            title: 'Custom Notifications',
            subtitle: 'Set your own rhythm 5-10 Nfts per day',
          ),
          SizedBox(height: 15),
          _buildPremiumFeatureRow(
            icon: 'assets/icons/trophy.svg',
            title: 'Alpha Circle Access',
            subtitle: 'Compete, climb ranks, and earn badges',
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                     context.push('/checkout_page');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Subscribe \$4.99 / mo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle yearly button
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Yearly \$39.99',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumFeatureRow({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        SvgPicture.asset(icon,width: 24, height: 24),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubscriptionOption({
    required String title,
    required String price,
    required String description,
    bool isCentered = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.categorycard_color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}