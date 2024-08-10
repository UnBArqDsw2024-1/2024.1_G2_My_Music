import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/size_config.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({super.key, this.text, this.fontSize, this.fontColor, this.fontWeight});
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text ?? "placeholder", style: TextStyle(color: fontColor ?? Colors.white, fontSize: responsiveFigmaFontSize(fontSize ?? 12), fontWeight: fontWeight ?? FontWeight.normal));
  }
}
