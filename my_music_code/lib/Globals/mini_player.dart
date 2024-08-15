import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/music_page.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:my_music_code/Globals/style.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        onPressed: () {
          showModalBottomSheet(
              useRootNavigator: false,
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => MusicPage(
                    music: universal.currentMusic,
                  ));
        },
        child: Container(
          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(5)),
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: NetworkImage(universal.currentMusic.imageUrl!))),
                        height: 64,
                        width: 64,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveText(
                              text: universal.currentMusic.name!,
                              fontColor: primaryFontColor, fontSize: 16,
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              universal.currentMusic.artist!,
                              style: TextStyle(color: secondaryFontColor, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      universal.audioPlayer.state == PlayerState.playing?
                      universal.audioPlayer.pause() : universal.audioPlayer.resume();
                    });
                  },
                  icon: Icon(
                    universal.audioPlayer.state == PlayerState.paused? Icons.play_arrow_rounded : Icons.pause_rounded, color: Colors.white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
