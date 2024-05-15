import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 80,
      required this.itemBuilder,
      this.scrollController,
      this.padding = EdgeInsets.zero,
      this.scrollPhysics = const AlwaysScrollableScrollPhysics()});

  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollController? scrollController;
  final EdgeInsets padding;
  final ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: padding,
        physics: scrollPhysics,
        controller: scrollController,
        itemCount: itemCount,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: 16,
            crossAxisSpacing: 3),
        itemBuilder: itemBuilder);
  }
}
