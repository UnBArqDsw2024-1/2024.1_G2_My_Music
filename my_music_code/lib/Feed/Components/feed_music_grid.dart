import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/music_playlist_feed_component.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/size_config.dart';

class Music {
  final String? name;
  final String? id;
  final String? artist;
  final String? imageUrl;

  Music({this.name, this.id, this.artist, this.imageUrl});
}

class FeedMusicGrid extends StatefulWidget {
  const FeedMusicGrid({super.key, required this.listaDeMusicas});
  final List<Music> listaDeMusicas;
  @override
  State<FeedMusicGrid> createState() => _FeedMusicGridState();
}

class _FeedMusicGridState extends State<FeedMusicGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveFigmaHeight(12)),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int index = 0;
                index < widget.listaDeMusicas.sublist(0, 8).length / 2;
                index++)
              // A cada interação do loop for ele vai criar uma Row contendo dois elementos de música cada um com index próprio a principio contando de 0 e 1
              // 0 e 1, 2 e 3, 4 e 5, 6 e 7
              Padding(
                padding: EdgeInsets.only(bottom: responsiveFigmaHeight(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MusicPlaylistFeedComponent(
                      music: widget.listaDeMusicas[index * 2],
                    ),
                    ResponsiveContainer(width: 10),
                    MusicPlaylistFeedComponent(
                      music: widget.listaDeMusicas[index * 2 + 1],
                    ),
                  ],
                ),
              ),
          ]),
    );
  }
}
