import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_shahin/core/utils/theme.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _enableNotifications = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  String? _selectedFrequency = '5 per day';
  TimeOfDay _startTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 0, minute: 0); 

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF5A687D), 
              onSurface: Colors.white, 
              surface: Color(0xFF2C3038),
            ), dialogTheme: DialogThemeData(backgroundColor: Color(0xFF2C3038)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != (isStartTime ? _startTime : _endTime)) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          '    Notification Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          height: 775.h,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.categorycard_color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('General'),
              _buildSectionDescription('Control how and when you receive motivational\nnotifications.'),
              SizedBox(height: 20),
              Container(
                child: 
                _buildToggleRow(
                  'Enable Notifications',
                  _enableNotifications,
                  (bool value) {
                    setState(() {
                      _enableNotifications = value;
                    });
                  },
                ),
              ),
              _buildToggleRow(
                'Sound',
                _soundEnabled,
                (bool value) {
                  setState(() {
                    _soundEnabled = value;
                  });
                },
              ),
              _buildToggleRow(
                'Vibration',
                _vibrationEnabled,
                (bool value) {
                  setState(() {
                    _vibrationEnabled = value;
                  });
                },
              ),
              SizedBox(height: 30),
              _buildSectionHeader('Frequency'),
              _buildSectionDescription('Choose how many motivational pushes you get each\nday (Premium only).'),
              SizedBox(height: 15),
              _buildFrequencyDropdown(),
              SizedBox(height: 30),
              _buildSectionHeader('Schedule'),
              _buildSectionDescription('Set time windows for notifications (Premium\nfeature).'),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildTimePickerField(
                      context,
                      'Start Time',
                      _startTime,
                      true,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: _buildTimePickerField(
                      context,
                      'End Time',
                      _endTime,
                      false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              _buildSaveButton(),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Changes are saved to your profile and synced\nacross devices.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTextColors.primary_color,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
             // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        description,
        style: TextStyle(
          color: AppTextColors.primary_color,
          fontSize: 15,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildToggleRow(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.button_background, 
            inactiveThumbColor: AppColors.background_color,
            inactiveTrackColor: AppColors.button_background,
            // ignore: deprecated_member_use
            activeTrackColor: AppColors.background_color,
          ),
        ],
      ),
    );
  }

  Widget _buildFrequencyDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.categorycard_color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.button_background),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedFrequency,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
          dropdownColor: AppColors.categorycard_color,
          style: TextStyle(color: Colors.white, fontSize: 16),
          onChanged: (String? newValue) {
            setState(() {
              _selectedFrequency = newValue;
            });
          },
          items: <String>['1 per day', '3 per day', '5 per day', '10 per day']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTimePickerField(
      BuildContext context, String label, TimeOfDay time, bool isStartTime) {
    return GestureDetector(
      onTap: () => _selectTime(context, isStartTime),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.categorycard_color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.button_background),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time.format(context),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(Icons.access_time, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          // Handle Save
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}