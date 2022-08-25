import 'package:flutter/material.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';
import 'package:flutter_scrollable/screen/custom_scroll_view_screen.dart';
import 'package:flutter_scrollable/screen/grid_view_screen.dart';
import 'package:flutter_scrollable/screen/list_view_screen.dart';
import 'package:flutter_scrollable/screen/refresh_indicator.dart';
import 'package:flutter_scrollable/screen/reorder_list_view_screen.dart';
import 'package:flutter_scrollable/screen/scrollbar_screen.dart';
import 'package:flutter_scrollable/screen/single_child_scroll_view_screen.dart';

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      builder: (_) => SingleChildScrollViewScreen(),
      btnText: 'SingleChildScrollView',
    ),
    ScreenModel(
      builder: (_) => ListViewScreen(),
      btnText: 'ListViewScreenView',
    ),
    ScreenModel(
      builder: (_) => GridViewScreen(),
      btnText: 'GridViewScreenView',
    ),
    ScreenModel(
      builder: (_) => ReorderableListViewScreen(),
      btnText: 'ReorderableListViewScreen',
    ),
    ScreenModel(
      builder: (_) => CustomScrollViewScreen(),
      btnText: 'CustomScrollViewScreen',
    ),
    ScreenModel(
      builder: (_) => ScrollbarScreen(),
      btnText: 'ScrollBarScreen',
    ),
    ScreenModel(
      builder: (_) => RefreshIndicatorScreen(),
      btnText: 'RefreshIndicatorScreen',
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map(
                (e) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: e.builder,
                    ));
                  },
                  child: Text(e.btnText),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ScreenModel {
  final WidgetBuilder builder;
  final String btnText;

  ScreenModel({
    required this.builder,
    required this.btnText,
  });
}
