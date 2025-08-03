import 'package:flutter/material.dart';
import 'package:reusable_list_view/reusable_list_view.dart';

class AppSliverGrid<T> extends StatelessWidget {
  const AppSliverGrid({
    super.key,
    required this.child,
    this.listData,
    this.childHeight = 6,
    this.childWidth = 3.5,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 2.0,
    this.crossAxisSpacing = 4.0,
    this.mainAxisExtent,
  });

  final List<T>? listData;
  final ChildBuilder<T> child;

  final double childHeight;
  final double childWidth;

  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    final double itemHeight = screenSize.height / childHeight;
    final double itemWidth = screenSize.width / childWidth;
    final double childAspectRatio = (itemWidth / itemHeight);

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final T itemData = listData![index];
        return child(itemData);
      }, childCount: listData?.length ?? 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
    );
  }
}
