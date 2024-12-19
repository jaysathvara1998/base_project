import 'package:base_project/features/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String productPage = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productPage:
        return MaterialPageRoute(builder: (_) => ProductPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Page Not Found'))),
        );
    }
  }
}
