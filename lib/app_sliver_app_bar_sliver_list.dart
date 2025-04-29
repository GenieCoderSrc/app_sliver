import 'package:flutter/material.dart';
import 'package:reusable_list_view/reusable_list_view.dart';
import 'sliver_list/app_sliver_list.dart';

class AppSliverAppBarSliverList<T> extends StatelessWidget {
  const AppSliverAppBarSliverList({
    super.key,
    required this.child,
    this.listData,
    this.sliverAppBar,
  });

  // sliver list property
  final ChildBuilder<T> child;
  final List<T>? listData;

  final Widget? sliverAppBar;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (sliverAppBar != null) sliverAppBar!,
        if (listData != null)
          AppSliverList<T>(child: child, listData: listData),
      ],
    );
  }
}
