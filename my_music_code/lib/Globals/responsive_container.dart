import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, this.height, this.width, this.color, this.child, this.borderRadius, this.isCubic = false, this.image});
  final double? height;
  final double? width;
  final bool isCubic;
  final Color? color;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final DecorationImage? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveFigmaHeight(height ?? 0),
      width: isCubic? responsiveFigmaHeight(width ?? 0): responsiveFigmaWidth(width ?? 0),
      decoration: BoxDecoration(
        color: color ?? backgroundColor, 
        borderRadius: borderRadius ?? BorderRadius.zero,
        image: image,
      ),
      child: child ?? SizedBox(),
    );
  }
}