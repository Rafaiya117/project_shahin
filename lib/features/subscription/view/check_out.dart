import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/utils/theme.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background_color,
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
          'Checkout',
          style: TextStyle(
            color: AppTextColors.primary_color,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm your subscription plan and payment\nmethod',
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            _buildSubscriptionSummary(),
            SizedBox(height: 30),
            Text(
              'Payment Method',
              style: TextStyle(
                color: AppTextColors.primary_color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 339.h,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.categorycard_color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildPaymentMethodOption(
                    icon: Image.asset('assets/images/applepay.png', height: 24), 
                    text: 'Apple Pay',
                  ),
                  SizedBox(height: 10),
                  _buildPaymentMethodOption(
                    icon: Image.asset('assets/images/gpay.png', height: 24), 
                    text: 'Google Pay',
                  ),
                  SizedBox(height: 10),
                  _buildPaymentMethodOption(
                    icon: Image.asset('assets/images/visa.png', height: 24), 
                    text: 'Visa',
                  ),
                  SizedBox(height: 10),
                  _buildPaymentMethodOption(
                    icon: Image.asset('assets/images/mastered.png', height: 24), 
                    text: 'Mastercard',
                  ),
                ],
              ),
            ),
            Spacer(),
            _buildConfirmButton(),
            SizedBox(height: 15),
            _buildCancelButton(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.categorycard_color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Premium Monthly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFProDisplay',
                ),
              ),
              Text(
                '\$4.99 / month',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ],
          ),
          Text(
            '\$4.99',
            style: TextStyle(
              color: AppTextColors.primary_color, 
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption({required Widget icon, required String text}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF2C3038),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            icon,
            SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Handle Confirm & Subscribe
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Confirm & Subscribe',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          // Handle Cancel
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Cancel',
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