// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/feed_page.dart';
import 'package:my_music_code/Globals/mini_player.dart';
import 'package:my_music_code/MyPlaylists/user_page_of_playlists.dart';
import 'package:my_music_code/Search/search_page.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:spotify/spotify.dart' hide User;

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key, required this.user, required this.spotifyApi});
  final User user;
  final SpotifyApi spotifyApi;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  PageController controller = PageController(initialPage: 1);
  int pageIndex = 1;

  setUser(){
    setState(() {
      universal.user = widget.user;
      universal.spotifyApi = widget.spotifyApi;
    });
  }

  setIndex(int index) {
    setState(() => pageIndex = index);
    controller.jumpToPage(index);
  }

  @override void initState() {
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 50,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => setIndex(0),
                icon: Icon(
                  Icons.search,
                  color: pageIndex == 0 ? primaryColor : Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () => setIndex(1),
                  icon: Icon(
                    Icons.home,
                    color: pageIndex == 1 ? primaryColor : Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => setIndex(2),
                icon: Icon(
                  Icons.library_music,
                  color: pageIndex == 2 ? primaryColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    SearchPage(),
                    FeedPage(),
                    UserPageOfPlaylists(),
                  ],
                ),
                StreamBuilder(
                  stream: universal.audioPlayer.onPlayerStateChanged, 
                  builder: (context, snapshot){
                    return snapshot.data == null ? Container() : Positioned(
                      bottom: 1, left: 0, right: 0,
                      child: MiniPlayer(),
                    );
                  }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
