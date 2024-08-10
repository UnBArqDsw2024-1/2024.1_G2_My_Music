import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';


class MusicPlaylistFeedComponent extends StatelessWidget {
  const MusicPlaylistFeedComponent({
    super.key, 
    this.title = DefaultPlaceholder.title, 
    this.thumbnailUrl = DefaultPlaceholder.image, 
    this.backgroundColor = DefaultPlaceholder.backgroundColor
  });
  final String thumbnailUrl;
  final String title;
  final Color backgroundColor;
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      height: 60,
      width: 160,
      color: secondaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Row(
        children: [
          ResponsiveContainer(
            height: 60,
            width: 60,
            isCubic: true,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
          ResponsiveText(text: title, fontColor: Colors.white,padding: EdgeInsets.only(left: responsiveFigmaWidth(5))),
        ],
      ),
    );
  }
}
