import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/feed_page.dart';
import 'package:my_music_code/MyPlaylists/my_playlists_page.dart';

import 'package:my_music_code/Search/search_page.dart';
import 'package:my_music_code/Globals/style.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  PageController controller = PageController(initialPage: 1);
  int pageIndex = 0;

  setIndex(int index) {
    setState(() => pageIndex = index);
    controller.jumpToPage(index);
  }

@override


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
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [
                SearchPage(),
                FeedPage(),
                MyPlaylists(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
