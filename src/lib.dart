import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

RichText getLogo(double size) {
  return RichText(
      text: TextSpan(
          style: new TextStyle(
            fontSize: size,
            color: Colors.white,
          ),
          children: <TextSpan>[
        TextSpan(text: "My", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "Health", style: TextStyle(fontWeight: FontWeight.w300))
      ]));
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
