import 'package:app_sliver/views/widgets/sliver_components/sliver_app_bar/app_sliver_app_bar.dart';
import 'package:app_sliver/views/widgets/section_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

class AppSliverTabBar extends StatelessWidget {
  const AppSliverTabBar({
    super.key,
    required this.tabHeaders,
    required this.tabScreens,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.pinnedTab = true,
    this.floatingTab = false,
    this.stretch = false,
    this.drawer,
    this.floatingActionButton,
    this.expandedHeight,
    this.bottomTitle,
    this.textScaler,
    this.topTitle,
    this.bottomTitleStyle,
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
    this.initialIndex,
    this.tabBgColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.getIndex,
    this.indicatorWeight,
    this.collapsedHeight,
    this.isBgTab = false,
    this.backgroundColor,
  });

  final Widget? drawer;
  final Widget? floatingActionButton;

  // sliver appbar property
  final bool pinned;
  final bool snap;
  final bool floating;
  final bool pinnedTab;
  final bool floatingTab;
  final bool stretch;
  final double? expandedHeight;
  final double? collapsedHeight;

  //  title related
  final String? bottomTitle;
  final TextStyle? bottomTitleStyle;
  final TextScaler? textScaler;
  final String? topTitle;
  final TextStyle? topTitleTxtStyle;
  final bool? topTitleCenter;
  final bool? bottomTitleCenter;

  final List<Widget>? actions;

  // back ground related
  final Widget? background;
  final String? imageSource;
  final BoxFit? imgFit;

  final Widget? bottomChild;
  final PreferredSizeWidget? bottom;

  // Styles
  final double? appBarRadius;
  final ShapeBorder? shape;
  final Color? tabBgColor;
  final Color? backgroundColor;

  // Tab bar
  final List<Widget> tabHeaders;
  final List<Widget> tabScreens;
  final int? initialIndex;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;
  final double? indicatorWeight;
  final Color? indicatorColor;
  final Function? getIndex;
  final bool isBgTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabHeaders.length,
      initialIndex: initialIndex ?? 0,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);

          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              final int index = tabController.index;
              debugPrint('AppSliverTabBar | addListener | index: $index');
              context.read<TabBarCubit>().setActiveTabIndex(index);
              getIndex?.call();
            }
          });
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    if (bottomTitle != null ||
                        imageSource != null ||
                        background != null)
                      AppSliverAppBar(
                        pinned: pinned,
                        snap: snap,
                        floating: floating,
                        stretch: stretch,
                        expandedHeight: expandedHeight ?? kToolbarHeight + 150,
                        collapsedHeight: collapsedHeight,
                        bottomTitle: bottomTitle,
                        textScaler: textScaler,
                        centerBottomTitle: bottomTitleCenter,
                        topTitle: topTitle,
                        topTitleStyle: topTitleTxtStyle,
                        bottomTitleStyle: bottomTitleStyle,
                        centerTopTitle: topTitleCenter,
                        actionsList: actions,
                        background: background,
                        backgroundColor: backgroundColor,
                        imageSource: imageSource,
                        imgFit: imgFit,
                        bottomChild: bottomChild,
                        bottom: isBgTab
                            ? PreferredSize(
                                preferredSize: const Size.fromHeight(
                                  kToolbarHeight,
                                ),
                                child:
                                    bottom ??
                                    Container(
                                      color: tabBgColor ?? Colors.black26,
                                      child: TabBar(
                                        tabs: tabHeaders,
                                        indicatorColor: indicatorColor,
                                        labelColor:
                                            selectedLabelColor ?? Colors.white,
                                        unselectedLabelColor:
                                            unselectedLabelColor,
                                        indicatorWeight: indicatorWeight ?? 2.0,
                                      ),
                                    ),
                              )
                            : null,
                        appBarRadius: appBarRadius,
                        shape: shape,
                      ),
                    if (!isBgTab)
                      SliverPersistentHeader(
                        pinned: pinnedTab,
                        floating: floatingTab,
                        delegate: SectionHeaderDelegate(
                          bgColor: tabBgColor ?? Colors.grey.shade100,
                          child: TabBar(
                            tabs: tabHeaders,
                            indicatorColor: indicatorColor,
                            indicatorWeight: indicatorWeight ?? 2.0,
                            labelColor: selectedLabelColor ?? Colors.black,
                            unselectedLabelColor:
                                unselectedLabelColor ?? Colors.grey,
                            // labelStyle: AppTxtStyles.kMidTitleTextStyle,
                          ),
                        ),
                      ),

                    // SliverPersistentHeader(
                    //   delegate: MySliverPersistentHeaderDelegate(
                    //     height: 500,
                    //     child: TabBarView(
                    //       controller: tabController,
                    //       children: tabScreens,
                    //     ),
                    //   ),
                    // ),
                    // SliverFillRemaining(
                    //   child: TabBarView(
                    //     controller: tabController,
                    //     children: tabScreens,
                    //   ),
                    // ),
                  ];
                },
            body: TabBarView(controller: tabController, children: tabScreens),
          );
        },
      ),
    );
  }
}
