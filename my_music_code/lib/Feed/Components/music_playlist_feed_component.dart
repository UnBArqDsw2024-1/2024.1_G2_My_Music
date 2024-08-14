import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Feed/music_page.dart';

class MusicPlaylistFeedComponent extends StatelessWidget {
  const MusicPlaylistFeedComponent(
      {super.key,
      this.backgroundColor = DefaultPlaceholder.backgroundColor,
      required this.music, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  final Music music;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      onPressed: () {
        showModalBottomSheet(
          useRootNavigator: false,
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return MusicPage(music: music, audioPlayer: audioPlayer,);
          });
      },
      child: ResponsiveContainer(
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
                image: NetworkImage(music.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
            ResponsiveText(
                text: music.name,
                fontColor: Colors.white,
                padding: EdgeInsets.only(left: responsiveFigmaWidth(5))),
          ],
        ),
      ),
    );
  }
}
