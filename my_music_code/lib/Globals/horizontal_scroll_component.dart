import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/cubic_button_with_image.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';

class HorizontalScrollComponent extends StatefulWidget {
  const HorizontalScrollComponent({super.key, required this.title, this.leftPadding});
  final String title;
  final double? leftPadding;
  @override
  State<HorizontalScrollComponent> createState() => _HorizontalScrollComponentState();
}

class _HorizontalScrollComponentState extends State<HorizontalScrollComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveFigmaHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
              text: widget.title,
              fontColor: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              padding: EdgeInsets.only(left: responsiveFigmaWidth(widget.leftPadding ?? 23))),
          ResponsiveContainer(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ResponsiveContainer(width: widget.leftPadding ?? 23),
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                    child: CubicButtonWithImage(
                      onPressed: (){},
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
