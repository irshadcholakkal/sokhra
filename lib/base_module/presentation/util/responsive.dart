import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static int mobileBreakPoint = 650; //850
  static int tabBreakPoint = 1100;

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakPoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabBreakPoint &&
      MediaQuery.of(context).size.width >= mobileBreakPoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabBreakPoint;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than tabBreakPoint then we consider it a desktop
    if (_size.width >= tabBreakPoint) {
      return desktop;
    }
    // If width it less then tabBreakPoint and more then mobileBreakPoint we consider it as tablet
    else if (_size.width >= mobileBreakPoint && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
