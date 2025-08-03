import 'package:flutter/material.dart';
import 'package:app_sliver/app_sliver.dart'; // Update with actual package name/path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Sliver Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SliverExampleScreen(),
    );
  }
}

class SliverExampleScreen extends StatelessWidget {
  const SliverExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSliverWithFabButton(
        topTitle: 'App Sliver Demo',
        bottomTitle: 'Sliver Grid View',
        imageSource: 'https://picsum.photos/800/400',
        floating: true,
        pinned: true,
        snap: false,
        stretch: true,
        expandedHeight: 250,
        fabIcon: Icons.add,
        fabTop: 220.0,
        fabRight: 16.0,
        onPressedFab: () => debugPrint("FAB Pressed!"),
        body: AppSliverGrid<String>(
          listData: List.generate(20, (i) => 'Item $i'),
          child:
              (item) => Card(
                margin: const EdgeInsets.all(8.0),
                child: Center(child: Text(item)),
              ),
          childHeight: 4.5,
          childWidth: 2,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      ),
    );
  }
}
