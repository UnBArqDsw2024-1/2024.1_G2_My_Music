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
  TextEditingController _searchController = TextEditingController();
  List<PlaylistModel> playlists = [];
  List<Widget> playlistWidgets = [];
  

  @override
  void initState() {
    super.initState();
    _initializePlaylists();
    _searchController.addListener(_filterList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int playlistNumber = 30; // Número de playlists para teste
  void _initializePlaylists() {
    playlists = List.generate(
      playlistNumber,
      (index) => PlaylistModel(
        name: 'Playlist $index',
        creator: 'Milenuda ${index + 1}',
      ),
    );
    _generatePlaylistWidgets();
  }

  void _generatePlaylistWidgets() {
    playlistWidgets = playlists.map((playlist) {
      return Padding(
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
            child: Row(
              children: [
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
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playlist.name,
                      style: TextStyle(
                        color: primaryFontColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      playlist.creator,
                      style: TextStyle(
                        color: secondaryFontColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  void _filterList() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      List<PlaylistModel> filteredPlaylists = playlists.where((playlist) {
        return playlist.name.toLowerCase().contains(query) ||
               playlist.creator.toLowerCase().contains(query);
      }).toList();

      // Regenera a lista de widgets filtrada
      playlistWidgets = filteredPlaylists.map((playlist) {
        return Padding(
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
              child: Row(
                children: [
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
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlist.name,
                        style: TextStyle(
                          color: primaryFontColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        playlist.creator,
                        style: TextStyle(
                          color: secondaryFontColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();
    });
  }

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          title: Text("${DefaultPlaceholder.title}'s Playlists",
              style: TextStyle(color: Colors.white)),
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
                      ][index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xff373737),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      4,
                      (index) => ListView(
                        children: playlistWidgets,
                      ),
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
          backgroundColor: secondaryColor,
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
