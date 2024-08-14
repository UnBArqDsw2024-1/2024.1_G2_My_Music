import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/MyPlaylists/new_playlist_page.dart';
import 'package:my_music_code/MyPlaylists/playlist_page.dart';

class UserPageOfPlaylists extends StatefulWidget {
  const UserPageOfPlaylists({super.key});

  @override
  State<UserPageOfPlaylists> createState() => _UserPageOfPlaylistsState();
}

class _UserPageOfPlaylistsState extends State<UserPageOfPlaylists> {
  bool _isBlurred = false;

  void _showBlurDialog(BuildContext context) {
    setState(() {
      _isBlurred = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreatePlaylistDialog();
      },
    ).then((_) {
      setState(() {
        _isBlurred = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int playlistNumber = 30; // Número de amigos para teste, futuramente pegar da database

    List<Widget> playlistWidget = List.generate(
      playlistNumber,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPlaylistPage()),
            );
          },
          splashColor: primaryColor.withOpacity(0.3),
          highlightColor: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(7.5),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 7.5),
                child: Container(
                  height: 105,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(DefaultPlaceholder.image),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Playlist $index',
                    style: TextStyle(
                      color: primaryFontColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Milenuda $index',
                    style: TextStyle(color: secondaryFontColor, fontWeight: FontWeight.w400, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          title: Text("${DefaultPlaceholder.title}'s Playlists", style: TextStyle(color: Colors.white)),
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
                ),
                child: TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: primaryColor,
                    ),
                    tabs: List.generate(
                      4,
                      (index) => Tab(
                          text: [
                        'Recent',
                        'Songs',
                        'Albums',
                        'Playlists',
                      ][index]),
                    )),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: List.generate(4, (index) => ListView(children: playlistWidget)),
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
          backgroundColor: secondaryColor,
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
