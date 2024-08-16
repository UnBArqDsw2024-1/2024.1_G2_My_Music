import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/Components/feed_horizontal_scroll_component.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Feed/Components/new_music_release.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/profile_drawer.dart';
import 'package:my_music_code/universal.dart' as universal;

class FeedPage extends StatefulWidget {
  const FeedPage({super.key, required this.albumReleases, required this.recentMusics, required this.musicRelease});
  final List<AlbumModel> albumReleases;
  final List<Music> recentMusics;
  final Music musicRelease;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: feedProfileAppBar(),
        drawer: ProfileDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FeedMusicGrid(listaDeMusicas: widget.recentMusics),
              NewMusicRelease(
                musicRelease: widget.musicRelease,
              ),
              FeedHorizontalScrollComponent(
                title: "Álbuns recentes",
                albuns: widget.albumReleases,
              ),
              FeedHorizontalScrollComponent(
                title: "Tocadas recentemente",
                albuns: widget.albumReleases,
              ),
              if (universal.currentMusic.name != null) Container(height: 180),
            ],
          ),
        ));
  }
}
