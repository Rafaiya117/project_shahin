import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class FavoriteCard extends StatefulWidget {
  final String text;
  final String svgIconPath;
  final Color initialIconColor;
  final Color tappedIconColor;
  final VoidCallback? onTap;

  const FavoriteCard({
    Key? key,
    required this.text,
    required this.svgIconPath,
    this.initialIconColor = Colors.white,
    this.tappedIconColor = Colors.redAccent,
    this.onTap,
  }) : super(key: key);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isTapped = false;

  void _handleTap() {
    setState(() {
      isTapped = !isTapped;
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap, // whole card clickable
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 170.w,
        height: 113.h,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.categorycard_color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  widget.svgIconPath,
                  color: isTapped
                      ? widget.tappedIconColor
                      : widget.initialIconColor,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
