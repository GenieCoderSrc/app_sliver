# Changelog

All notable changes to this project will be documented in this file.

## 0.0.6

### Sep 10, 2025

### ✨ Updated

- Updated `reusable_image_widget` to 0.1.7

## 0.0.5

### Sep 8, 2025

### ✨ Updated

- Updated `reusable_image_widget` to 0.1.6

## 0.0.4

### Aug 22, 2025

### ✨ Updated

- Updated `reusable_image_widget` to 0.1.5
- Updated `reusable_tab_bar` to 0.0.2
- Updated `reusable_list_view` to 0.0.5
- Updated Dart sdk to 3.9.0
- Removed `flutter_lints` Dependency

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
