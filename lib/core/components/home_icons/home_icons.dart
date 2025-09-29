import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Color activeColor = Colors.red,
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
        buildSvgIcon(
          assetPath: 'assets/icons/share.svg',
          isActive: isShared,
          onTap: () => setState(() => isShared = !isShared),
        ),
        const SizedBox(width: 12),
        buildSvgIcon(
          assetPath: 'assets/icons/bookmark.svg',
          isActive: isBookmarked,
          onTap: () => setState(() => isBookmarked = !isBookmarked),
        ),
      ],
    );
  }
}
