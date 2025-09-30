import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_shahin/core/utils/theme.dart';

class QuoteCard extends StatefulWidget {
  final String quoteText;
  final String authorName;
  final String dateText;
  final String likeIconPath;
  final String commentIconPath;
  final String shareIconPath;
  final bool showActions; 
  final VoidCallback? onShare;
  const QuoteCard({
    Key? key,
    required this.quoteText,
    required this.authorName,
    required this.dateText,
    required this.likeIconPath,
    required this.commentIconPath,
    required this.shareIconPath,
    this.showActions = true,
    this.onShare, 
  }) : super(key: key);

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  bool isLiked = false;
  bool isCommented = false;
  bool isShared = false;

  void toggle(String type) {
    setState(() {
      if (type == 'like') isLiked = !isLiked;
      if (type == 'comment') isCommented = !isCommented;
      if (type == 'share') isShared = !isShared;
    });
  }

  Widget iconButton(String path, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        color: isActive ? Colors.redAccent : AppColors.button_background,
        width: 16.w,
        height: 16.h,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.categorycard_color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Quote + Author inline
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.quoteText + " ",
                  style: const TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: "- ${widget.authorName}",
                  style: const TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: AppTextColors.primary_color,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          /// Date + (optional) Action Buttons
          Row(
            children: [
              Text(
                widget.dateText,
                style: TextStyle(
                  color: AppTextColors.primary_color,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              if (widget.showActions) ...[
                iconButton(widget.likeIconPath, isLiked, () => toggle('like')),
                const SizedBox(width: 16),
                iconButton(widget.commentIconPath, isCommented, () => toggle('comment')),
                const SizedBox(width: 16),
                // iconButton(widget.shareIconPath, isShared, () => toggle('share')),
                iconButton(widget.shareIconPath, isShared, () {
                  toggle('share');
                  if (widget.onShare != null) widget.onShare!();
                }),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
