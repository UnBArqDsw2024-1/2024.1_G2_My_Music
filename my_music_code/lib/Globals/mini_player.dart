import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/music_page.dart';
import 'package:my_music_code/universal.dart' as universal;
// import 'package:my_music_code/Feed/music_page.dart';
import 'package:my_music_code/Globals/style.dart';
// ignore: duplicate_import
import 'style.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});
  // final AudioPlayer audioPlayer;
  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            useRootNavigator: false,
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => MusicPage(music: universal.currentMusic,)
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(5)
          ),
          height: 80, 
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: NetworkImage(universal.currentMusic.imageUrl!))
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
                    Text(universal.currentMusic.name!, style: TextStyle(color: primaryFontColor, fontSize: 16),),
                    Text(universal.currentMusic.artist!, style: TextStyle(color: secondaryFontColor, fontSize: 12),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}