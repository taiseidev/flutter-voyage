import 'package:flutter/material.dart';

class SquareStyle extends ThemeExtension<SquareStyle> {
  const SquareStyle({
    this.color,
    this.size,
    this.borderRadius,
  });

  final Color? color;
  final double? size;
  final double? borderRadius;

  @override
  ThemeExtension<SquareStyle> copyWith({
    Color? color,
    double? size,
    double? borderRadius,
  }) =>
      SquareStyle(
        color: color ?? this.color,
        size: size ?? this.size,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  ThemeExtension<SquareStyle> lerp(
      ThemeExtension<SquareStyle>? other, double t) {
    if (other is! SquareStyle) {
      return this;
    }

    return SquareStyle(
      color: Color.lerp(color, other.color, t),
    );
  }
}
