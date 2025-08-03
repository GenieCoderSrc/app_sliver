import 'package:flutter/material.dart';

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double? height;
  final Color? bgColor;

  SectionHeaderDelegate({required this.child, this.bgColor, this.height});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(color: bgColor, child: child);
  }

  @override
  double get maxExtent => height ?? 50;

  @override
  double get minExtent => height ?? 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
