import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SmallText extends StatelessWidget {
  String? title;
  Color? color;
  double size;
  TextOverflow? overflow;
  double? latterSpaceing;
  double? heightSpacing;
  FontWeight? weight;

  SmallText(
      {this.color = const Color(0xff0E243E),
      this.title,
      this.size = 12,
      this.overflow = TextOverflow.ellipsis,
      this.weight,
      this.heightSpacing,
      this.latterSpaceing});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          letterSpacing: latterSpaceing,
          height: heightSpacing),
    );
  }
}
