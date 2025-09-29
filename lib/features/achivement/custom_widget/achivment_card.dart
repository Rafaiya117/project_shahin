import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shahin/core/components/landing_page_customwidget/prograss_indigator_widget.dart';
import 'package:project_shahin/core/utils/theme.dart';

class AchievementBadge extends StatefulWidget {
  final String title;
  final String description;
  final double progress; 
  final String iconPath;
  final bool initiallySelected;
  final VoidCallback? onTap;

  const AchievementBadge({
    Key? key,
    required this.title,
    required this.description,
    required this.progress,
    required this.iconPath,
    this.initiallySelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<AchievementBadge> createState() => _AchievementBadgeState();
}

class _AchievementBadgeState extends State<AchievementBadge> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
  }

  void _handleTap() {
    setState(() {
      isSelected = !isSelected;
    });
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 170.w,
        height: 212.h,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.blueAccent, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          children: [
           Image.asset(
              widget.iconPath,
              width: 40,
              height: 40,
              //color: Colors.white, // optional
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ProgressIndicatorWidget(
                    barHeight: 4,
                    percentage: widget.progress * 100.toInt(),
                    progressColor: AppColors.button_background,
                ),
                  const SizedBox(height: 4),
                  Text(
                    "${(widget.progress * 100).toInt()}% Complete",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
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
}
