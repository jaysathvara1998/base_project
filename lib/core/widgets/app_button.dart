import 'package:base_project/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final double? elevation;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.padding,
    this.shape,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? AppColors.accentColor,
        backgroundColor: color ?? AppColors.primaryColor,
        minimumSize: const Size.fromHeight(50),
        padding: padding ??
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: elevation ?? 2.0,
        textStyle: TextStyle(fontSize: fontSize ?? 16.0),
      ),
      child: Text(text),
    );
  }
}
