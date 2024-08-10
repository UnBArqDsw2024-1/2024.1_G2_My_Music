import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/music_playlist_feed_component.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/size_config.dart';

class FeedMusicGrid extends StatefulWidget {
  const FeedMusicGrid({super.key});

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
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MusicPlaylistFeedComponent(),
              ResponsiveContainer(width: 10),
              MusicPlaylistFeedComponent(),
            ],
          ),
          ResponsiveContainer(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MusicPlaylistFeedComponent(),
              ResponsiveContainer(width: 10),
              MusicPlaylistFeedComponent(),
            ],
          ),

          ResponsiveContainer(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MusicPlaylistFeedComponent(),
              ResponsiveContainer(width: 10),
              MusicPlaylistFeedComponent(),
            ],
          ),
          ResponsiveContainer(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MusicPlaylistFeedComponent(),
              ResponsiveContainer(width: 10),
              MusicPlaylistFeedComponent(),
            ],
          ),
        ]
      ),
    );
  }
}