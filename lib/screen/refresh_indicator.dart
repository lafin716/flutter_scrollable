import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'RefreshIndicatorScreen',
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView(
          children: numbers
              .map(
                (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length],
                  index: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    if (index != null) {
      print(index);
    }

    return Container(
      color: color,
      height: height ?? 300,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
    );
  }
}