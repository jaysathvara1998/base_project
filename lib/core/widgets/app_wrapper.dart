import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final PreferredSizeWidget? appBar;

  const AppWrapper(
      {super.key, required this.child, this.isLoading = false, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          children: [
            child,
            if (isLoading)
              Container(
                color: Colors.black12,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
