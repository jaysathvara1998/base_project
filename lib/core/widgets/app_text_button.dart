import 'package:base_project/core/constants/app_colors.dart';
import 'package:base_project/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final VoidCallback onPressed;
  final TextAlign textAlign;
  final double? wordSpacing;
  final String? fontFamily;
  final bool isUnderline;
  final bool isStrikethrough;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = 14,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.textColor,
    this.wordSpacing,
    this.textAlign = TextAlign.center,
    this.fontFamily,
    this.isUnderline = false,
    this.isStrikethrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: AppText.caption(
        text: text,
        textAlign: textAlign,
        color: AppColors.primaryColor,
      ),
    );
  }
}
