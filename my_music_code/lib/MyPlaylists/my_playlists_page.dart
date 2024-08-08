import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class MyPlaylists extends StatefulWidget {
  const MyPlaylists({super.key});

  @override
  State<MyPlaylists> createState() => _MyPlaylistsState();
}

class _MyPlaylistsState extends State<MyPlaylists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Playlists',style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: backgroundColor,
      body: const Center(
        child: Icon(Icons.person,color: Colors.white),
      ),
    );
  }
}