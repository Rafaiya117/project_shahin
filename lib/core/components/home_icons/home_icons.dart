import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shahin/core/utils/theme.dart';
import 'package:project_shahin/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

class IconRow extends StatefulWidget {

  final VoidCallback? onHeartTap;
  const IconRow({super.key, this.onHeartTap});

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  bool isLiked = false;
  bool isShared = false;
  bool isBookmarked = false;

  Widget buildSvgIcon({
  required String assetPath,
  required bool isActive,
  required VoidCallback onTap,
  Color activeColor = AppColors.indigator_active,
  Color inactiveColor = Colors.white,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isActive ? activeColor : inactiveColor,
        BlendMode.srcIn,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSvgIcon(
          assetPath: 'assets/icons/heart.svg',
          isActive: isLiked,
          onTap: () {
            setState(() => isLiked = !isLiked);
            if (widget.onHeartTap != null) widget.onHeartTap!();
          },
          //activeColor: Colors.white,
        ),
        const SizedBox(width: 12), 
        Consumer<HomeController>(
          builder: (context, controller, _) {
            return buildSvgIcon(
              assetPath: 'assets/icons/share.svg',
              isActive: isShared,
              onTap: () {
                setState(() => isShared = !isShared);
                controller.shareQuote();
              },
            );
          },
        ),
        const SizedBox(width: 12),
        // buildSvgIcon(
        //   assetPath: 'assets/icons/bookmark.svg',
        //   isActive: isBookmarked,
        //   onTap: () => setState(() => isBookmarked = !isBookmarked),
        // ),
        buildSvgIcon(
          assetPath: 'assets/icons/bookmark.svg',
          isActive: isBookmarked,
          onTap: () {
            setState(() => isBookmarked = !isBookmarked);

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: AppColors.categorycard_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    'Saved',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  content: Text(
                    'Quote has been saved to your bookmarks.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTextColors.primary_color,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
