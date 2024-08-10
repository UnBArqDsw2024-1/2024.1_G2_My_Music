import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_horizontal_scroll_component.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/Components/new_music_release.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
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
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: ResponsiveContainer(
              height: 30,
              width: 30,
              borderRadius: BorderRadius.circular(100),
              isCubic: true,
              image: DecorationImage(
                image: NetworkImage(DefaultPlaceholder.image),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        title: ResponsiveText(text: "Hi, Milena Baruc, let's play some music.", fontSize: 16),
      ),
      
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
