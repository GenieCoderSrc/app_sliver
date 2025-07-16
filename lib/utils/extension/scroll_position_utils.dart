import 'package:flutter/widgets.dart';

extension ScrollPositionUtils on ScrollController {
  /// Calculates FAB vertical [top] position and scale factor based on scroll.
  ///
  /// - [topStart]: starting top position (default: 215.0).
  /// - [scaleStart]: pixel range before scaling starts (default: 160.0).
  /// - Returns a tuple: `(top position, scale factor)`.
  (double top, double scale) calculateAppbarBottomPosition({
    double topStart = 215.0,
    double scaleStart = 160.0,
  }) {
    final double scaleEnd = scaleStart / 2;
    double top = topStart;
    double scale = 1.0;

    if (hasClients) {
      final double scrollOffset = this.offset;
      top -= scrollOffset;

      if (scrollOffset < topStart - scaleStart) {
        scale = 1.0;
      } else if (scrollOffset < topStart - scaleEnd) {
        scale = (topStart - scaleEnd - scrollOffset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return (top, scale);
  }
}
