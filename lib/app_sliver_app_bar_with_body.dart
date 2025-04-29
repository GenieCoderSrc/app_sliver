import 'package:flutter/material.dart';

import 'sliver_app_bar/app_sliver_app_bar.dart';

class AppSliverAppBarWithBody extends StatelessWidget {
  const AppSliverAppBarWithBody({
    super.key,
    this.body,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.expandedHeight,
    this.bottomTitle,
    this.textScaler,
    this.topTitle,
    this.titleTxtStyle,
    this.topTitleTxtStyle,
    this.topTitleCenter = true,
    this.bottomTitleCenter,
    this.actions,
    this.background,
    this.imageSource,
    this.imgFit,
    this.bottomChild,
    this.bottom,
    this.appBarRadius,
    this.shape,
    this.collapsedHeight,
    this.backgroundColor,
    this.heroTag,
  });

  // Fab builder
  final String? heroTag;

  // sliver appbar property
  final bool pinned;
  final bool snap;
  final bool floating;
  final bool stretch;
  final double? expandedHeight;
  final double? collapsedHeight;

  //  title related
  final String? bottomTitle;
  final TextStyle? titleTxtStyle;
  final TextScaler? textScaler;
  final String? topTitle;
  final TextStyle? topTitleTxtStyle;
  final bool? topTitleCenter;
  final bool? bottomTitleCenter;

  final List<Widget>? actions;

  // back ground related
  final Widget? background;
  final String? imageSource;
  final BoxFit? imgFit;

  final Widget? bottomChild;
  final PreferredSizeWidget? bottom;

  // Styles
  final double? appBarRadius;
  final ShapeBorder? shape;
  final Color? backgroundColor;

  // Tab bar
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (bottomTitle != null || imageSource != null || background != null)
          AppSliverAppBar(
            pinned: pinned,
            snap: snap,
            floating: floating,
            stretch: stretch,
            expandedHeight: expandedHeight ?? kToolbarHeight + 150,
            bottomTitle: bottomTitle,
            textScaler: textScaler,
            centerBottomTitle: bottomTitleCenter,
            topTitle: topTitle,
            topTitleTxtStyle: topTitleTxtStyle,
            titleTxtStyle: titleTxtStyle,
            centerTopTitle: topTitleCenter,
            actionsList: actions,
            background: background,
            backgroundColor: backgroundColor,
            imageSource: imageSource,
            imgFit: imgFit,
            bottomChild: bottomChild,
            appBarRadius: appBarRadius,
            shape: shape,
          ),
        if (body != null) body!,
      ],
    );
  }
}
