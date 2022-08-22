import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScroll',
      body: renderSimple(),
    );
  }

  /**
   * physics 종류
   *
   * 1. ClampingScrollPhysics
   * 2. BouncingScrollPhysics
   * 3. AlwaysScrollableScrollPhysics
   * 4. NeverScrollableScrollPhysics
   */

  // 기본 랜더링
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 강제 스크롤 랜더링
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        color: Colors.blue,
        height: 300,
      ),
    );
  }

  // 강제 스크롤 시 잘리지 않게 랜더링
  Widget renderAlwaysNotClipScroll() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        color: Colors.blue,
        height: 300,
      ),
    );
  }

  Widget renderPerformance() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: numbers
            .map((e) =>
                renderContainer(color: rainbowColors[e % rainbowColors.length]))
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }

    return Container(
      color: color,
      height: 300,
    );
  }
}
