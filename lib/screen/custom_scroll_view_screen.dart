import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverPersistentHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  // covariant - 상속 된 클래스도 사용가능
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(10, (index) => index);

  CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppBar(),
          renderHeader(),
          renderSliverChildList(),
          renderHeader(),
          renderBuilderChildSliverList(),
          renderHeader(),
          renderBuilderGridFixedList(),
        ],
      ),
    );
  }

  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      // 헤더들이 스크롤 시 쌓인다
      pinned: true,
      delegate: _SliverPersistentHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'Awesome',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        minHeight: 75,
        maxHeight: 150,
      ),
    );
  }

  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      // 스크롤 시 리스트 중간에서 위로 땡길 때 앱바 노출
      floating: true,
      // 스크롤 시에도 앱바 고정
      pinned: false,
      // 조금만 움직여도 앱바가 가려지고 나온다, floating이 true여야 한다.
      snap: true,
      // 위로 끝까지 땡겨도 앱바가 따라온다.
      stretch: true,
      // 앱바 밑에 추가 공간
      expandedHeight: 200,
      // 앱바 자체가 스크롤되는 최소 사이즈
      collapsedHeight: 150,

      flexibleSpace: FlexibleSpaceBar(
        title: Text('Flex~'),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  SliverGrid renderBuilderGridFixedList() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // ListView.builder 생성자와 유사함
  SliverList renderBuilderChildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 10,
      ),
    );
  }

  // ListView 기본 생성자와 유사함
  SliverList renderSliverChildList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
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
