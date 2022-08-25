import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ReorderableListViewScreen',
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return renderContainer(
            color: rainbowColors[numbers[index] % rainbowColors.length],
            index: numbers[index],
          );
        },
        itemCount: numbers.length,
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        },
      ),
    );
  }

  Widget renderDefault() {
    return ReorderableListView(
      children: numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // [red, orange, yellow]
          // [0, 1, 2]

          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
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
      key: Key(index.toString()),
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
