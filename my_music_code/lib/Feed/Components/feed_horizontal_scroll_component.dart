import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';

class FeedHorizontalScrollComponent extends StatefulWidget {
  const FeedHorizontalScrollComponent({super.key, required this.title});
  final String title;
  @override
  State<FeedHorizontalScrollComponent> createState() => _FeedHorizontalScrollComponentState();
}

class _FeedHorizontalScrollComponentState extends State<FeedHorizontalScrollComponent> {
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
              padding: EdgeInsets.only(left: responsiveFigmaWidth(23))),
          ResponsiveContainer(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ResponsiveContainer(width: 23),
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                    child: ResponsiveContainer(
                      height: 100,
                      width: 100,
                      isCubic: true,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
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
