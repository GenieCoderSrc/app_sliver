# app_sliver

A customizable Flutter package that simplifies the creation of complex scrollable UIs using slivers. `app_sliver` provides prebuilt sliver-based widgets including flexible SliverAppBar, SliverList, SliverGrid, persistent headers, and more—all designed to enhance your productivity and UI consistency.

## Features

- 📱 **SliverAppBar+**: Extendable SliverAppBar with rich customization including images, texts, stretch modes, actions, and flexible backgrounds.
- 🧱 **AppSliverGrid & AppSliverList**: Dynamic sliver grid/list builders for efficient list rendering.
- 🧭 **AppSliverTabBar**: Integrated tab bar support using `NestedScrollView` and sliver headers.
- 🎯 **FloatingActionButton Transformer**: FAB that scales and moves based on scroll position.
- 🔖 **Persistent Headers**: Custom header widgets that stay visible on scroll.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  app_sliver: latest_version
```

Then run:

```bash
flutter pub get
```

## Usage

### Sliver AppBar
```dart
AppSliverAppBar(
  pinned: true,
  snap: false,
  floating: true,
  topTitle: 'Welcome',
  bottomTitle: 'Dashboard',
  imageSource: 'assets/header.jpg',
  actionsList: [Icon(Icons.settings)],
)
```

### Sliver List
```dart
AppSliverList<String>(
  listData: ['One', 'Two', 'Three'],
  child: (item) => ListTile(title: Text(item)),
)
```

### Sliver Grid
```dart
AppSliverGrid<int>(
  listData: List.generate(20, (i) => i),
  child: (item) => Card(child: Center(child: Text('$item'))),
  crossAxisCount: 2,
  childHeight: 3.5,
  childWidth: 2.0,
  mainAxisSpacing: 8.0,
  crossAxisSpacing: 8.0,
)
```

### Sliver Tab Bar
```dart
AppSliverTabBar(
  tabHeaders: [Text('Tab 1'), Text('Tab 2')],
  tabScreens: [ScreenOne(), ScreenTwo()],
)
```

### FAB with Scroll Positioning
```dart
AppSliverWithFabButton(
  floatingActionButton: FloatingActionButton(onPressed: () {}),
  fabTop: 200.0,
  fabRight: 16.0,
  pinned: true,
  body: AppSliverList<String>(...),
)
```

## License

MIT © Shohidul Islam
