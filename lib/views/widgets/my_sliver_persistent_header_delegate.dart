import 'package:flutter/material.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  MySliverPersistentHeaderDelegate({required this.child, this.height = 0.0});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => kToolbarHeight + height;

  @override
  double get minExtent => kToolbarHeight + height;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
