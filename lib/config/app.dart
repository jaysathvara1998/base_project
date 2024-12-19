import 'package:base_project/config/routes.dart';
import 'package:base_project/config/themes.dart';
import 'package:base_project/core/utils/navigation.dart';
import 'package:base_project/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.init(constraints, orientation);
        return MaterialApp(
          title: 'Base Project',
          navigatorKey: Navigation.navigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: Routes.productPage,
          theme: AppTheme.lightTheme,
        );
      });
    });
  }
}