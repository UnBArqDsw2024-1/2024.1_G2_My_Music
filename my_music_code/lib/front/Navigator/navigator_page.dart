import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/front/Feed/feed_page.dart';
import 'package:my_music_code/front/Profile/profile_page.dart';

import 'package:my_music_code/front/Search/search_page.dart';
import 'package:my_music_code/front/style.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  setIndex(int index) {
    setState(() => pageIndex = index);
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 50,
          color: const Color(0xff000000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => setIndex(0),
                icon: Icon(
                  CupertinoIcons.search,
                  color: pageIndex == 0 ? primaryColor : Colors.white,
                ),
              ),

              SizedBox(width: 15),

              IconButton(
                onPressed: () => setIndex(1),
                icon: Icon(
                  CupertinoIcons.home,
                  color: pageIndex == 1 ? primaryColor : Colors.white,
                ),
              ),

              SizedBox(width: 15),

              IconButton(
                onPressed: () => setIndex(2),
                icon: Icon(
                  CupertinoIcons.music_note_list,
                  color: pageIndex == 2 ? primaryColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
        
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            SearchPage(),
            FeedPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
