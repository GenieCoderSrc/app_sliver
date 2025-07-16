import 'package:app_sliver/views/widgets/sliver_components/sliver_list/app_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:reusable_list_view/reusable_list_view.dart';

class AppSliverAppBarSliverGrid<T> extends StatelessWidget {
  const AppSliverAppBarSliverGrid({
    super.key,
    this.sliverAppBar,
    required this.child,
    this.listData,
    this.childHeight = 6,
    this.childWidth = 3.5,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 2.0,
    this.crossAxisSpacing = 4.0,
    this.mainAxisExtent,
  });

  final Widget? sliverAppBar;

  // sliver list property
  final ChildBuilder<T> child;
  final List<T>? listData;

  final double childHeight;
  final double childWidth;

  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (sliverAppBar != null) sliverAppBar!,
        if (listData != null)
          AppSliverGrid<T>(
            child: child,
            listData: listData,
            childHeight: childHeight,
            childWidth: childWidth,
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisExtent: mainAxisExtent,
          ),
      ],
    );
  }
}
