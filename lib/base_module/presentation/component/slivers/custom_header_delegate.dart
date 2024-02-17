import 'package:flutter/material.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomHeaderDelegate({
    this.minHeight = kToolbarHeight,
    this.maxHeight = kToolbarHeight,
    required this.child,
  });

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
