import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    super.key,
    this.pinned = true,
    this.snap = false,
    this.floating = false,
    this.stretch,
    this.expandedHeight,
    this.topTitle,
    this.topTitleStyle,
    this.bottomTitle,
    this.bottomTitleStyle,
    this.textScaler,
    this.centerTopTitle,
    this.actionsList,
    this.background,
    this.imageSource,
    this.imgFit,
    this.bottomChild,
    this.bottomHeight,
    this.bottom,
    this.appBarRadius,
    this.shape,
    this.backgroundColor,
    this.stretchModes,
    this.centerBottomTitle,
    this.collapsedHeight,
  });

  final bool pinned;
  final bool snap;
  final bool floating;
  final double? expandedHeight;
  final double? collapsedHeight;
  final bool? stretch;
  final List<StretchMode>? stretchModes;

  final String? topTitle;
  final String? bottomTitle;
  final TextStyle? topTitleStyle;
  final TextStyle? bottomTitleStyle;
  final TextScaler? textScaler;
  final bool? centerTopTitle;
  final bool? centerBottomTitle;

  final List<Widget>? actionsList;

  final Widget? background;
  final String? imageSource;
  final BoxFit? imgFit;

  final Widget? bottomChild;
  final double? bottomHeight;
  final PreferredSizeWidget? bottom;

  final double? appBarRadius;
  final ShapeBorder? shape;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      snap: snap,
      floating: floating,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      expandedHeight: expandedHeight ?? (kToolbarHeight + 120),
      collapsedHeight: collapsedHeight,
      stretch: stretch ?? false,
      title:
          topTitle != null
              ? Text(
                topTitle!,
                textScaler: textScaler,
                style:
                    topTitleStyle ??
                    Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              )
              : null,
      centerTitle: centerTopTitle,
      actions: actionsList,
      flexibleSpace: FlexibleSpaceBar(
        title:
            bottomTitle != null
                ? Text(
                  bottomTitle!,
                  textScaler: textScaler,
                  style:
                      bottomTitleStyle ??
                      Theme.of(context).textTheme.titleMedium,
                )
                : null,
        centerTitle: centerBottomTitle,
        background:
            imageSource != null
                ? AppImageResolver().resolveImage(
                  imageSource: imageSource,
                  fit: imgFit ?? BoxFit.cover,
                )
                : background,
        stretchModes: stretchModes ?? const [StretchMode.zoomBackground],
      ),
      bottom:
          bottomChild != null
              ? PreferredSize(
                preferredSize: Size.fromHeight(bottomHeight ?? kToolbarHeight),
                child: bottomChild!,
              )
              : bottom,
      shape:
          appBarRadius != null
              ? RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(appBarRadius!),
                ),
              )
              : shape,
    );
  }
}

// class AppSliverAppBar extends StatelessWidget {
//   const AppSliverAppBar({
//     super.key,
//     this.pinned = true,
//     this.snap = false,
//     this.floating = false,
//     this.stretch,
//     this.expandedHeight,
//     this.topTitle,
//     this.topTitleTxtStyle,
//     this.bottomTitle,
//     this.titleTxtStyle,
//     this.textScaler,
//     this.centerTopTitle,
//     this.actionsList,
//     this.background,
//     this.imageSource,
//     this.imgFit,
//     this.bottomChild,
//     this.bottomHeight,
//     this.bottom,
//     this.appBarRadius,
//     this.shape,
//     this.backgroundColor,
//     this.stretchModes,
//     this.centerBottomTitle,
//     this.collapsedHeight,
//   });
//
//   // sliver appbar property
//   final bool pinned;
//   final bool snap;
//   final bool floating;
//   final double? expandedHeight;
//   final double? collapsedHeight;
//
//   final bool? stretch;
//   final List<StretchMode>? stretchModes;
//
//   //  title related
//   final String? topTitle;
//   final String? bottomTitle;
//   final TextStyle? titleTxtStyle;
//   final TextStyle? topTitleTxtStyle;
//   final TextScaler? textScaler;
//   final bool? centerTopTitle;
//   final bool? centerBottomTitle;
//
//   final List<Widget>? actionsList;
//
//   // back ground related
//   final Widget? background;
//   final String? imageSource;
//   final BoxFit? imgFit;
//
//   final Widget? bottomChild;
//   final double? bottomHeight;
//   final PreferredSizeWidget? bottom;
//
//   // Style
//   final double? appBarRadius;
//   final ShapeBorder? shape;
//   final Color? backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: pinned,
//       snap: snap,
//       floating: floating,
//       backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
//       expandedHeight: expandedHeight ?? kToolbarHeight + 120,
//       collapsedHeight: collapsedHeight,
//       stretch: stretch ?? false,
//       title: Text(
//         topTitle ?? '',
//         textScaler: textScaler,
//         style:
//             topTitleTxtStyle ??
//             AppTxtStyles.kBigTitleTextStyle.copyWith(color: Colors.white),
//       ),
//       centerTitle: centerTopTitle,
//       flexibleSpace: FlexibleSpaceBar(
//         title:
//             bottomTitle != null
//                 ? Text(
//                   bottomTitle ?? '',
//                   textScaler: textScaler,
//                   style: titleTxtStyle,
//                 )
//                 : null,
//         centerTitle: centerBottomTitle,
//         background:
//             imageSource != null
//                 ? AppImageResolver().resolveImage(imageSource: imageSource)
//                 : background,
//         stretchModes: stretchModes ?? [StretchMode.zoomBackground],
//       ),
//       bottom:
//           bottomChild != null
//               ? PreferredSize(
//                 preferredSize: Size.fromHeight(bottomHeight ?? kToolbarHeight),
//                 child: bottomChild!,
//               )
//               : bottom,
//       shape:
//           appBarRadius != null
//               ? RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(appBarRadius ?? 20.0),
//                 ),
//               )
//               : shape,
//     );
//   }
// }
