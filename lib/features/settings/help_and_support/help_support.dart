import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/components/textfields/custom_textfield.dart';
import 'package:project_shahin/core/utils/theme.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 40.h),
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
                    "Help & Support",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize:20.sp ,
                      fontWeight:FontWeight.w500 ,
                      color: AppTextColors.primary_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Column(
                children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Submit a request",
                    style: TextStyle(
                      fontFamily: 'SFProDispaly',
                      fontSize:18.sp ,
                      fontWeight:FontWeight.w500,
                      color: AppTextColors.primary_color
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                CustomTextField(
                  hintText: "Enter Email Address",
                  iconPath: "assets/icons/email_icon.svg",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // handle change
                  },
                  hasBorder: false,
                  fillColor: AppColors.categorycard_color,
                ),
                SizedBox(height: 20.h,),
                TextField(
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTextColors.primary_color,
                    fontFamily: 'SFProDisplay',
                  ),
                  decoration: InputDecoration(
                    hintText:'Please enter the details of your request. A member of our support staff will respond as soon as possible.',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppTextColors.primary_color,
                      fontFamily: 'SFProDisplay',
                    ),
                    filled: true,
                    fillColor: AppColors.categorycard_color, 
                    contentPadding: EdgeInsets.all(16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.button_background, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.button_background, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.button_background, width: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                InkWell(
                  onTap: () {
                    // Trigger file picker logic here
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.categorycard_color, 
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: 
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Add file',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppTextColors.third_color, 
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' or drop files here',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              SizedBox(height: 20.h,),
              SizedBox(
              width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Submit',
                  onPressed: () {
                    //context.push('/login');
                  },
                  backgroundColor: AppColors.button_background,
                  textColor: AppTextColors.secondary_color,
                    //borderColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}