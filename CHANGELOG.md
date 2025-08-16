# Changelog

All notable changes to this project will be documented in this file.

## 0.0.3

### Aug 16, 2025

### ✨ Updated

- Updated `reusable_list_view` package

## 0.0.2

### Jul 16, 2025

### Added

- `AppSliverWithOverlappedChild`: New sliver widget supporting overlapped child layout with precise positioning (e.g.,
  avatar or FAB).
- `AppSliverWithProfile`: A sliver layout optimized for profile headers with optional avatar/floating action.
- `PositionalTransformerBuilder`: Reusable widget for scroll-based FAB/avatar scaling and repositioning.
- `scrollController.calculateAppbarBottomPosition`: Extension method to compute scroll-based transformation.
- Support for custom FAB shape via `fabRadius` and positioning with `fabLeft`, `fabRight`, and `fabTop`.
- Optional circle or rectangle image display support for FAB-like avatars.
- Improved sliver app bar flexibility by exposing shape, background color, leading, titleWidget, and other configurable
  properties.

### Refactored

- Modularized app sliver layouts under the `screens/` folder.
- Extracted scroll utilities and custom sliver headers into `widgets/` and `utils/extensions/` folders to follow SOLID
  principles.

---

## 0.0.1

### Jul 14, 2025

### Added

- `AppSliverWithFabButton`: A customizable sliver layout widget with support for flexible space, tab bar, sliver
  list/grid, and a floating action button.
- `AppSliverList`: A reusable widget for creating sliver lists.
- `AppSliverGrid`: A reusable widget for creating sliver grids.
- Basic image background support in the sliver app bar.
- FAB positioning customization (`fabTop`, `fabRight`).
- Tabbed view support with `SliverTabBarView` integration.
- Initial example included demonstrating grid usage with FAB.
