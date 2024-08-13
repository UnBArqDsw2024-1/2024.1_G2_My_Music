import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/feed_music_page.dart';
import 'package:my_music_code/Globals/style.dart';
// ignore: duplicate_import
import 'style.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedMusicPage()));
      },
      child: Container(
        color: secondaryColor,
        height: 80, 
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: NetworkImage(DefaultPlaceholder.image))
                ),
                height: 64, width: 64,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Música legal", style: TextStyle(color: primaryFontColor, fontSize: 16),),
                  Text("Luísa Sonza", style: TextStyle(color: secondaryFontColor, fontSize: 12),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}