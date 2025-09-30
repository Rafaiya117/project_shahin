import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class ToggleItem {
  final String label;
  final String? svgIcon; 
  final VoidCallback onTap; // custom action instead of route

  ToggleItem({
    required this.label,
    this.svgIcon,
    required this.onTap,
  });
}

class CustomToggleBar extends StatefulWidget {
  final List<ToggleItem> items;
  final int initialIndex;

  const CustomToggleBar({
    super.key,
    required this.items,
    this.initialIndex = 1,
  });

  @override
  State<CustomToggleBar> createState() => _CustomToggleBarState();
}

class _CustomToggleBarState extends State<CustomToggleBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onSelect(int index) {
    setState(() => _selectedIndex = index);
    widget.items[index].onTap(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.categorycard_color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final bool isSelected = index == _selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => _onSelect(index),
              child: Container(
                width: 165.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.only(
                  left: index == 0 ? 4.w : 2.w,
                  right: index == widget.items.length - 1 ? 4.w : 2.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.svgIcon != null && item.svgIcon!.isNotEmpty) ...[
                      SvgPicture.asset(
                        item.svgIcon!,
                        width: 16.w,
                        height: 16.h,
                        color: isSelected
                            ? Colors.black
                            : AppTextColors.primary_color,
                      ),
                      SizedBox(width: 6.w),
                    ],
                    Text(
                      item.label,
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.black
                            : AppTextColors.primary_color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
