import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/size_config.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({super.key, this.text, this.fontSize, this.fontColor, this.fontWeight, this.padding});
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text ?? "placeholder", 
        style: TextStyle(
          color: fontColor ?? Colors.white, 
          fontSize: responsiveFigmaFontSize(fontSize ?? 12), 
          fontWeight: fontWeight ?? FontWeight.normal
        ),
        overflow: TextOverflow.ellipsis,
      )
    );
  }
}
