import 'package:flutter/material.dart';
import 'package:my_music_code/Artist/artist_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/style.dart';

class CubicButtonWithImage extends StatefulWidget {
  const CubicButtonWithImage({super.key, this.height, this.width, this.image, this.borderRadius, this.color, this.onPressed});
  final double? height, width;
  final BorderRadius? borderRadius;
  final ImageProvider<Object>? image;
  final Color? color;
  final Function()? onPressed;
  @override
  State<CubicButtonWithImage> createState() => _CubicButtonWithImageState();
}

class _CubicButtonWithImageState extends State<CubicButtonWithImage> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      onPressed: widget.onPressed ?? () => Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistPage())),
      child: ResponsiveContainer(
        height: widget.height ?? 100,
        width: widget.width ?? 100,
        isCubic: true,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
        image: DecorationImage(image: widget.image ?? NetworkImage(DefaultPlaceholder.image)),
        color: widget.color ?? Colors.white,
      ),
    );
  }
}
