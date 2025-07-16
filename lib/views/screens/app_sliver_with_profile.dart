import 'package:app_sliver/views/widgets/sliver_components/sliver_app_bar/app_sliver_app_bar.dart';
import 'package:app_sliver/views/widgets/positional_transformer_builder.dart';
import 'package:flutter/material.dart';

class AppSliverWithProfile extends StatefulWidget {
  const AppSliverWithProfile({
    super.key,
    this.body,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.floatingActionButton,
    this.fabTop,
    this.fabRight,
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
    this.fabIsCircleImage = true,
    this.fabRadius,
  });

  // FAB properties
  final String? heroTag;
  final IconData? fabIcon;
  final VoidCallback? onPressedFab;
  final String? fabImageSource;
  final Widget? floatingActionButton;
  final double? fabTop;
  final double? fabRight;
  final bool? fabIsCircleImage;
  final double? fabRadius;

  // SliverAppBar properties
  final bool pinned;
  final bool snap;
  final bool floating;
  final bool stretch;
  final double? expandedHeight;
  final double? collapsedHeight;

  // Title related
  final String? bottomTitle;
  final TextStyle? titleTxtStyle;
  final TextScaler? textScaler;
  final String? topTitle;
  final TextStyle? topTitleTxtStyle;
  final bool? topTitleCenter;
  final bool? bottomTitleCenter;

  final List<Widget>? actions;

  // Background related
  final Widget? background;
  final String? imageSource;
  final BoxFit? imgFit;

  final Widget? bottomChild;
  final PreferredSizeWidget? bottom;

  // Styles
  final double? appBarRadius;
  final ShapeBorder? shape;
  final Color? backgroundColor;

  // Body
  final Widget? body;

  @override
  State<AppSliverWithProfile> createState() => _AppSliverWithProfileState();
}

class _AppSliverWithProfileState extends State<AppSliverWithProfile> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
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
                topTitleStyle: widget.topTitleTxtStyle,
                bottomTitleStyle: widget.titleTxtStyle,
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
            if (widget.body != null) SliverFillRemaining(child: widget.body),
          ],
        ),
        PositionalTransformerBuilder(
          scrollController: _scrollController,
          floatingActionButton: widget.floatingActionButton,
          icon: widget.fabIcon,
          heroTag: widget.heroTag,
          imageSource: widget.fabImageSource,
          onPressed: widget.onPressedFab,
          topStart: widget.fabTop,
          right: widget.fabRight,
          isCircleImage: widget.fabIsCircleImage,
          imageRadius: widget.fabRadius,
        ),
      ],
    );
  }
}
