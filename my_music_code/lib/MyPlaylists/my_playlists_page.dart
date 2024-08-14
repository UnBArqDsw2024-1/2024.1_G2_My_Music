//import 'dart:js_interop';

import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/MyPlaylists/new_playlist_page.dart';

class MyPlaylists extends StatefulWidget {
  const MyPlaylists({super.key});

  @override
  State<MyPlaylists> createState() => _MyPlaylistsState();
}

class _MyPlaylistsState extends State<MyPlaylists> {
  bool _isBlurred = false;

  void _showBlurDialog(BuildContext context) {
    setState(() {
      _isBlurred = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewPlaylistPage(); 
      },
    ).then((_) {
      setState(() {
        _isBlurred = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('My Playlists', style: TextStyle(color: Colors.white)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: primaryColor,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Recent',
                    ),
                    Tab(
                      text: 'Songs',
                    ),
                    Tab(
                      text: 'Albums',
                    ),
                    Tab(
                      text: 'Playlists',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            const TabBarView(
              children: [
                Center(
                  child: Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Songs',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Albums',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Playlist',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            if (_isBlurred)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBlurDialog(context); 
          },
          backgroundColor: backgroundColor,
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}

  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     initialIndex: 1,
  //     length: 4,
  //     child: Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: backgroundColor,
  //       title: Text('My Playlists',style: TextStyle(color: Colors.white)),
  //       bottom: TabBar(
  //         labelColor: Colors.white,
  //         // indicator: BoxDecoration(
  //         //   color: primaryColor,
  //         // ),
  //         tabs: <Widget>[
  //           Tab(
  //             text: 'Recent',
  //           ),
  //           Tab(
  //             text: 'Songs',
  //           ),
  //           Tab(
  //             text: 'Albums',
  //           ),
  //           Tab(
  //             text: 'Playlists',
  //           ),
  //         ],
  //       ),
  //     ),
      
  //     backgroundColor: backgroundColor,
  //     body: const Center(
  //       child: Icon(Icons.person,color: Colors.white),
  //     ),
  //   ),
  // );
  // }