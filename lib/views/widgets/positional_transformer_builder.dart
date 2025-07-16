import 'package:app_sliver/app_sliver.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class PositionalTransformerBuilder extends StatelessWidget {
  const PositionalTransformerBuilder({
    super.key,
    required this.scrollController,
    this.heroTag,
    this.icon,
    this.imageSource,
    this.onPressed,
    this.floatingActionButton,
    this.topStart,
    this.right,
    this.left,
    this.isCircleImage,
    this.imageRadius,
  });

  final ScrollController scrollController;
  final String? heroTag;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String? imageSource;
  final Widget? floatingActionButton;
  final double? topStart;
  final double? right;
  final double? left;
  final bool? isCircleImage;
  final double? imageRadius;

  @override
  Widget build(BuildContext context) {
    final (top, scale) = scrollController.calculateAppbarBottomPosition(
      topStart: topStart ?? 250,
    );

    return Positioned(
      top: top,
      right: right ?? 16.0,
      left: left,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: floatingActionButton ?? _buildDefaultChild(),
      ),
    );
  }

  Widget _buildDefaultChild() {
    if (imageSource != null) {
      return InkWell(
        onTap: onPressed,
        child: AppAvatar(
          imageSource: imageSource,
          isCircle: isCircleImage ?? true,
          radius: imageRadius ?? 40.0,
        ),
      );
    } else {
      return FloatingActionButton(
        elevation: 0.0,
        mini: true,
        heroTag: heroTag ?? 'sliver_fab_action',
        onPressed: onPressed,
        child: Icon(icon ?? Icons.add),
      );
    }
  }
}

// class PositionalTransformerBuilder extends StatelessWidget {
//   const PositionalTransformerBuilder({
//     super.key,
//     required this.scrollController,
//     this.heroTag,
//     this.icon,
//     this.imageSource,
//     this.imgFile,
//     this.onPressed,
//     this.floatingActionButton,
//     this.topStart,
//     this.right,
//     this.left,
//     this.imageRadius,
//   });
//
//   final ScrollController scrollController;
//   final String? heroTag;
//   final IconData? icon;
//   final VoidCallback? onPressed;
//
//   final String? imageSource;
//   final File? imgFile;
//
//   final Widget? floatingActionButton;
//   final double? topStart;
//   final double? right;
//   final double? left;
//   final double? imageRadius;
//
//   @override
//   Widget build(BuildContext context) {
//     final double top =
//         calculateAppbarBottomPosition(scrollController, topStart: topStart).$1;
//     final double scale = calculateAppbarBottomPosition(scrollController).$2;
//
//     return Positioned(
//       top: top,
//       right: right ?? 16.0,
//       left: left,
//       child: Transform(
//         transform: Matrix4.identity()..scale(scale),
//         alignment: Alignment.center,
//         child:
//             floatingActionButton ??
//             (imageSource != null || imgFile != null
//                 ? InkWell(
//                   onTap: onPressed,
//                   child: AppAvatar(
//                     imageSource: imageSource,
//                     radius: imageRadius ?? 40,
//                   ),
//                 )
//                 : FloatingActionButton(
//                   elevation: 0.0,
//                   mini: true,
//                   heroTag: heroTag ?? "sliver Fab Action",
//                   onPressed: onPressed,
//                   child: AppIcon(icon ?? Icons.add),
//                 )),
//       ),
//     );
//   }
// }
