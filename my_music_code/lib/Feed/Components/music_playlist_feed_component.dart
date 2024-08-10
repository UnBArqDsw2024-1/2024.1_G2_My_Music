import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class DefaultPlaceholder {
  static const String title = "Default";
  static const String image = "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png";
  static const Color backgroundColor =Color(0xff373737);
}

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
    return Container(
      height: responsiveFigmaHeight(60),
      width: responsiveFigmaWidth(160),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: responsiveFigmaHeight(60),
            width: responsiveFigmaHeight(60),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox(width: responsiveFigmaWidth(5)),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
