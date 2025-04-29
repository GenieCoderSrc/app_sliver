import 'dart:io';

import 'package:flutter/material.dart';
import 'sliver_app_bar/app_sliver_app_bar.dart';
import 'widgets/positional_transformer_builder.dart';

class AppSliverWithOverlappedChild extends StatefulWidget {
  const AppSliverWithOverlappedChild({
    super.key,
    this.body,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.overlappedChild,
    this.fabTop,
    this.fabRight,
    this.fabLeft,
    this.fabRadius,
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
    this.fabIcon,
    this.fabImageSource,
    this.onPressedFab,
    this.fabImageFile, this.bgColor, this.titleWidget, this.leading, this.actionsList, this.willShowBackArrow,
  });

  // Fab builder
  final String? heroTag;
  final IconData? fabIcon;
  final VoidCallback? onPressedFab;

  final String? fabImageSource;
  final File? fabImageFile;

  final Widget? overlappedChild;
  final double? fabTop;
  final double? fabRight;
  final double? fabLeft;
  final double? fabRadius;

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

  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;

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
  State<AppSliverWithOverlappedChild> createState() =>
      _AppSliverWithOverlappedChildState();
}

class _AppSliverWithOverlappedChildState
    extends State<AppSliverWithOverlappedChild> {
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            if (widget.bottomTitle != null ||
                widget.topTitle != null ||
                widget.imageSource != null ||
                widget.background != null)
              AppSliverAppBar(
                pinned: widget.pinned,
                snap: widget.snap,
                floating: widget.floating,
                stretch: widget.stretch,
                expandedHeight: widget.expandedHeight ?? kToolbarHeight + 150,
                bottomTitle: widget.bottomTitle,
                textScaler: widget.textScaler,
                centerBottomTitle: widget.bottomTitleCenter,
                topTitle: widget.topTitle,
                topTitleTxtStyle: widget.topTitleTxtStyle,
                titleTxtStyle: widget.titleTxtStyle,
                centerTopTitle: widget.topTitleCenter,
                actionsList: widget.actions,
                background: widget.background,
                backgroundColor: widget.backgroundColor,
                imageSource: widget.imageSource,
                imgFit: widget.imgFit,
                bottomChild: widget.bottomChild,
                appBarRadius: widget.appBarRadius,
                shape: widget.shape,
              ),
            if (widget.body != null)
              // if (widget.body != null) widget.body!
              SliverFillRemaining(child: widget.body),
          ],
        ),
        PositionalTransformerBuilder(
          scrollController: _scrollController,
          floatingActionButton: widget.overlappedChild,
          icon: widget.fabIcon,
          imgFile: widget.fabImageFile,
          imageSource: widget.fabImageSource,
          onPressed: widget.onPressedFab,
          topStart: widget.fabTop,
          right: widget.fabRight,
          left: widget.fabLeft,
          radius: widget.fabRadius,
        ),
      ],
    );
  }
}
