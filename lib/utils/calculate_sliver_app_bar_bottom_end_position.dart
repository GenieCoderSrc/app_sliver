import 'package:flutter/material.dart';

(double, double) calculateAppbarBottomPosition(
    ScrollController scrollController,
    {double? topStart}) {
  // starting fab position
  double defaultTopMargin = topStart ?? 215.0;
  // const double defaultTopMargin = 200.0 - 4.0;

  // pixels from top where scaling should start
  const double scaleStart = 160.0;

  // pixels from top where scaling should end
  const double scaleEnd = scaleStart / 2;

  double top = defaultTopMargin;
  double scale = 1.0;

  if (scrollController.hasClients) {
    double offset = scrollController.offset;
    top -= offset;
    if (offset < defaultTopMargin - scaleStart) {
      //   offset small => don't scale down
      scale = 1.0;
    } else if (offset < defaultTopMargin - scaleEnd) {
      //   offset between scaleStart and scaleEnd => scale down
      scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
    } else {
      //   offset passed scaleEnd => hide fab
      scale = 0.0;
    }
  }

  return (top, scale);
}
