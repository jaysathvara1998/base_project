import 'package:base_project/core/constants/app_colors.dart';
import 'package:base_project/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final int? maxLines;
  final Color color;
  final double? wordSpacing;
  final String? fontFamily;
  final VoidCallback? onClick;
  final TextAlign textAlign;
  final double? height;
  final bool isUnderline;
  final bool isStrikethrough;
  final TextOverflow? overflow;
  final bool isSoftWrap;

  const AppText({
    super.key,
    required this.text,
    this.size = 14,
    this.fontWeight = FontWeight.w500,
    this.fontFamily,
    this.color = AppColors.textColor,
    this.wordSpacing,
    this.onClick,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.height,
    this.overflow,
    this.isUnderline = false,
    this.isStrikethrough = false,
    this.isSoftWrap = true,
  });

  const AppText.title({
    super.key,
    required this.text,
    this.size = 16.0,
    this.fontWeight = FontWeight.bold,
    this.fontFamily,
    this.color = AppColors.textColor,
    this.wordSpacing,
    this.onClick,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.height,
    this.overflow,
    this.isUnderline = false,
    this.isStrikethrough = false,
    this.isSoftWrap = true,
  });

  const AppText.subTitle({
    super.key,
    required this.text,
    this.size = 14.0,
    this.fontWeight = FontWeight.w600,
    this.fontFamily,
    this.color = AppColors.textColor,
    this.wordSpacing,
    this.onClick,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.height,
    this.overflow,
    this.isUnderline = false,
    this.isStrikethrough = false,
    this.isSoftWrap = true,
  });

  const AppText.caption({
    super.key,
    required this.text,
    this.size = 12.0,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.color = AppColors.contentSecondaryColor,
    this.wordSpacing,
    this.onClick,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.height,
    this.overflow,
    this.isUnderline = false,
    this.isStrikethrough = false,
    this.isSoftWrap = true,
  });

  const AppText.description({
    super.key,
    required this.text,
    this.size = 12.0,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.color = AppColors.contentTertiaryColor,
    this.wordSpacing,
    this.onClick,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.height,
    this.overflow,
    this.isUnderline = false,
    this.isStrikethrough = false,
    this.isSoftWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    if (onClick != null) {
      return AppTextButton(
        text: text,
        onPressed: onClick!,
        size: size,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing,
        textAlign: textAlign,
        fontFamily: fontFamily,
        isUnderline: isUnderline,
        isStrikethrough: isStrikethrough,
      );
    }

    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow ??
          (maxLines == 1 ? TextOverflow.ellipsis : TextOverflow.clip),
      softWrap: isSoftWrap,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing,
        fontFamily: fontFamily,
        height: height,
        decoration: isUnderline
            ? TextDecoration.underline
            : isStrikethrough
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }
}
