import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_horizontal_scroll_component.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Feed/Components/new_music_release.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/profile_drawer.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: backgroundColor,

      appBar: feedProfileAppBar(),
      
      drawer: ProfileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FeedMusicGrid(),
            NewMusicRelease(),
            FeedHorizontalScrollComponent(title: "Top World Albuns"),
            FeedHorizontalScrollComponent(title: "Tocadas recentemente"),
          ],
        ),
      )
    );
  }
}

