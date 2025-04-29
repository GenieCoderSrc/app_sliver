import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_icon/reusable_icon.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

import '../utils/calculate_sliver_app_bar_bottom_end_position.dart';

class PositionalTransformerBuilder extends StatelessWidget {
  const PositionalTransformerBuilder({
    super.key,
    required this.scrollController,
    this.heroTag,
    this.icon,
    this.imageSource,
    this.imgFile,
    this.onPressed,
    this.floatingActionButton,
    this.topStart,
    this.right,
    this.left,
    this.radius,
  });

  final ScrollController scrollController;
  final String? heroTag;
  final IconData? icon;
  final VoidCallback? onPressed;

  final String? imageSource;
  final File? imgFile;

  final Widget? floatingActionButton;
  final double? topStart;
  final double? right;
  final double? left;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final double top =
        calculateAppbarBottomPosition(scrollController, topStart: topStart).$1;
    final double scale = calculateAppbarBottomPosition(scrollController).$2;

    return Positioned(
        top: top,
        right: right ?? 16.0,
        left: left,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: floatingActionButton ??
              (imageSource != null || imgFile != null
                  ? InkWell(
                      onTap: onPressed,
                      child: AppCircleAvatar(
                          imageSource: imageSource,
                          img: imgFile,
                          radius: radius))
                  : FloatingActionButton(
                      elevation: 0.0,
                      mini: true,
                      heroTag: heroTag ?? "sliver Fab Action",
                      onPressed: onPressed,
                      child: AppIcon(icon ?? Icons.add),
                    )),
        ));
  }
}
