import 'dart:ui';

import 'package:flutter_painter/src/controllers/drawables/shape/dotted_line_drawable.dart';

import 'shape_factory.dart';

/// A [DottedLineDrawable] factory.
class DottedLineFactory extends ShapeFactory<DottedLineDrawable> {
  /// Creates an instance of [DottedLineFactory].
  DottedLineFactory() : super();

  /// Creates and returns a [DottedLineDrawable] with length of 0 and the passed [position], [dashWidth], [gapWidth], and [paint].
  @override
  DottedLineDrawable create(Offset position, [Paint? paint]) {
    return DottedLineDrawable(length: 0, position: position, paint: paint);
  }
}
