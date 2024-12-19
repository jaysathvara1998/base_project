import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SizeUtils {
  static double? screenWidth;
  static late double screenHeight;

  static void init(BoxConstraints boxConstraints, Orientation orientation) {
    screenWidth = boxConstraints.maxWidth;
    screenHeight = boxConstraints.maxHeight;
    debugPrint('screenWidth $screenWidth screenHeight $screenHeight');
  }

  static double get(double size) {
    if (screenWidth! < 600) {
      return size;
    } else {
      return kIsWeb ? size * 1.1 : size * 1.5;
    }
  }

  static double getHP(double percentage) {
    return (screenHeight * percentage) / 100;
  }

  static double getWP(double percentage) {
    return (screenWidth! * percentage) / 100;
  }

  static double? getFontSize(double? size) {
    if (size == null) {
      return null;
    }
    if (screenWidth! < 600) {
      return size;
    } else {
      return kIsWeb ? size * 1.2 : size * 1.5;
    }
  }

  static double getHeightAsPerPercent(double percent) {
    return screenHeight * (percent / 100);
  }

  static double getWidthAsPerPercent(double percent) {
    return screenWidth! * (percent / 100);
  }

  static String get _getDeviceType {
    final data = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  static bool get isTablet {
    return _getDeviceType == 'tablet';
  }

  static bool get isSmallerDevice {
    return screenWidth! < 365;
  }

  static int crossAxisCount = SizeUtils.isTablet
      ? SizeUtils.screenWidth! < 1150
          ? SizeUtils.screenWidth! < 720
              ? 1
              : 2
          : SizeUtils.screenWidth! > 1500
              ? 4
              : 3
      : 1;
}

extension GetSizeFromDouble on double {
  double getSize() {
    return SizeUtils.get(this);
  }

  double? getFontSize() {
    return SizeUtils.getFontSize(this);
  }
}

extension GetSizeFromInt on int {
  double getSize() {
    return SizeUtils.get(toDouble());
  }

  double? getFontSize() {
    return SizeUtils.getFontSize(toDouble());
  }
}
