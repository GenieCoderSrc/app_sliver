import 'package:flutter/material.dart';
import 'package:reusable_list_view/reusable_list_view.dart';

class AppSliverList<T> extends StatelessWidget {
  const AppSliverList({super.key, required this.child, this.listData});

  final List<T>? listData;
  final ChildBuilder<T> child;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final T itemData = listData![index];
        return child(itemData);
      }, childCount: listData?.length ?? 0),
    );
  }
}
