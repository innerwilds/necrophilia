library necrophilia;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '_builder.dart';

@AllAligns()
// ignore: camel_case_types
abstract interface class __NECROPHILIA__ {}

final class Circle extends LeafRenderObjectWidget {
  const Circle({
    super.key,
    required this.color,
    required this.radius,
  }) : assert(radius != double.infinity, "radius can't be infinite");

  const Circle.fit({
    super.key,
    required this.color,
  }) : radius = double.infinity;

  final double radius;
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CircleRenderObject(
      radius: radius,
      color: color,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('radius', radius, level: DiagnosticLevel.info));
  }
}

final class CircleRenderObject extends RenderProxyBoxWithHitTestBehavior {
  CircleRenderObject({
    required this.radius,
    required Color color,
  }) : _color = color, super(behavior: HitTestBehavior.opaque);

  Color _color;
  final double radius;

  /// The fill color for this render object.
  Color get color => _color;
  set color(Color value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size > Size.zero) {
      final r = radius.isInfinite ? size.shortestSide / 2 : radius;
      context.canvas.drawCircle(offset + Offset(r, r), r, Paint()..color = color);
    }
  }
}