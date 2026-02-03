import 'package:flutter/material.dart';

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final Key backgroundImageKey;

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox =
    scrollable.context.findRenderObject() as RenderBox;
    final listItemBox =
    listItemContext.findRenderObject() as RenderBox;

    final listItemOffset =
    listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension =
        scrollable.position.viewportDimension;

    final scrollFraction =
    (listItemOffset.dy / viewportDimension)
        .clamp(0.0, 1.0);

    final verticalAlignment =
    Alignment(0.0, scrollFraction * 2 - 1);

    final backgroundSize =
    (context.getChildSize(0) ?? Size.zero);

    final listItemSize = context.size;

    final childRect =
    verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
