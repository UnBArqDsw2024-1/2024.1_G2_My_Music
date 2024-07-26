import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/front/Feed/feed_page.dart';
import 'package:my_music_code/front/Library/library.dart';
import 'package:my_music_code/front/Search/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() => pageIndex = index);
            controller.animateToPage(index, duration:  const Duration(milliseconds: 250), curve: Curves.easeIn);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: pageIndex == 0 ? Colors.green : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
                color: pageIndex == 1 ? Colors.green : Colors.grey,
              ),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.music_note_list,
                color: pageIndex == 2 ? Colors.green : Colors.grey,  
              ),
              label: 'Library',
            ),
          ],
        ),

        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            FeedPage(),
            SearchPage(),
            LibraryPage(),
          ],
        ),
      ),
    );
  }
}
