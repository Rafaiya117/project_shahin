import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/components/custom_button/custom_button.dart';
import 'package:project_shahin/core/utils/theme.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

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
                  SvgPicture.asset(
                    'assets/icons/arrow_forward.svg',
                    width: 13.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 20.w,),
                  Text(
                    "Notification Settings",
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
              Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.categorycard_color, 
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GENERAL SECTION
                  Text(
                    'General',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Control how and when you receive motivational notifications.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildToggle('Enable Notifications', true),
                  _buildToggle('Sound', false),
                  _buildToggle('Vibration', true),

                  SizedBox(height: 24.h),

                  // FREQUENCY SECTION
                  Text(
                    'Frequency',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Choose how many motivational pushes you get each day (Premium only).',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  DropdownButtonFormField<String>(
                    value: '5 per day',
                    items: ['1 per day', '3 per day', '5 per day', '10 per day']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) {},
                    dropdownColor: AppColors.button_background,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.categorycard_color,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // SCHEDULE SECTION
                  Text(
                    'Schedule',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Set time windows for notifications (Premium feature).',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white70,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: _timeField('Start Time', '08:00 AM')),
                      SizedBox(width: 12.w),
                      Expanded(child: _timeField('End Time', '12:00 AM')),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: 'Save',
                      onPressed: () {
                        //context.push('/login');
                      },
                      backgroundColor: AppColors.button_background,
                      textColor: AppTextColors.secondary_color,
                      //borderColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Changes are saved to your profile and synced across devices.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white54,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildToggle(String label, bool value) {
  return SwitchListTile(
    value: value,
    onChanged: (val) {},
    title: Text(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontFamily: 'SFProDisplay',
      ),
    ),
    activeColor: Colors.white,
    inactiveTrackColor: Colors.white24,
    contentPadding: EdgeInsets.zero,
  );
}

Widget _timeField(String label, String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white70,
          fontFamily: 'SFProDisplay',
        ),
      ),
      SizedBox(height: 6.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.categorycard_color,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontFamily: 'SFProDisplay',
          ),
        ),
      ),
    ],
  );
}
}