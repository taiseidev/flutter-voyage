import 'package:flutter/material.dart';

import 'square_style.dart';

class Square extends StatelessWidget {
  const Square({
    Key? key,
    this.style,
    this.child,
  }) : super(key: key);

  final SquareStyle? style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<SquareStyle>()!;
    final size = style?.size ?? defaultStyle.size;
    final color = style?.color ?? defaultStyle.color;
    final borderRadius = style?.borderRadius ?? defaultStyle.borderRadius;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius) : null,
      ),
      child: child,
    );
  }
}
