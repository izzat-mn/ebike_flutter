import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget? body;
  final List<Widget>? children;
  final Widget? bottomNavigationBar;
  const PageTemplate(
      {super.key,
      this.appBar,
      this.padding,
      this.body,
      this.children,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body ??
            SingleChildScrollView(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children ?? [],
              ),
            ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
