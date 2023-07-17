import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../object_drawable.dart';
import 'shape_drawable.dart';
import '../sized1ddrawable.dart';

class DottedLineDrawable extends Sized1DDrawable implements ShapeDrawable {
  @override
  Paint paint;

  double dashWidth;
  double gapWidth;

  DottedLineDrawable({
    Paint? paint,
    required double length,
    required Offset position,
    double rotationAngle = 0,
    double scale = 1,
    Set<ObjectDrawableAssist> assists = const <ObjectDrawableAssist>{},
    Map<ObjectDrawableAssist, Paint> assistPaints =
        const <ObjectDrawableAssist, Paint>{},
    bool locked = false,
    bool hidden = false,
    this.dashWidth = 10.0,
    this.gapWidth = 10.0,
  })  : paint = paint ?? ShapeDrawable.defaultPaint,
        super(
          length: length,
          position: position,
          rotationAngle: rotationAngle,
          scale: scale,
          assists: assists,
          assistPaints: assistPaints,
          locked: locked,
          hidden: hidden,
        );

  @protected
  @override
  EdgeInsets get padding => EdgeInsets.all(paint.strokeWidth / 2);

  @override
  void drawObject(Canvas canvas, Size size) {
    final segmentCount = (length / (dashWidth + gapWidth)).floor();
    final segmentLength = length / segmentCount;
    final segmentDelta = Offset(segmentLength * scale, 0);

    final start = position.translate(-length / 2 * scale, 0);
    final end = position.translate(length / 2 * scale, 0);

    for (double i = 0; i < segmentCount; i++) {
      final segmentStart = start + segmentDelta * i;
      final segmentEnd =
          segmentStart + segmentDelta * (dashWidth / (dashWidth + gapWidth));
      canvas.drawLine(segmentStart, segmentEnd, paint);
    }
  }

  @override
  DottedLineDrawable copyWith({
    bool? hidden,
    Set<ObjectDrawableAssist>? assists,
    Offset? position,
    double? rotation,
    double? scale,
    double? length,
    Paint? paint,
    bool? locked,
  }) {
    return DottedLineDrawable(
      hidden: hidden ?? this.hidden,
      assists: assists ?? this.assists,
      position: position ?? this.position,
      rotationAngle: rotation ?? rotationAngle,
      scale: scale ?? this.scale,
      length: length ?? this.length,
      paint: paint ?? this.paint,
      locked: locked ?? this.locked,
      dashWidth: dashWidth,
      gapWidth: gapWidth,
    );
  }
}
