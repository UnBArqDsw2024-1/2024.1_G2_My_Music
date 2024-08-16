import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Models/playlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/MyPlaylists/new_playlist_page.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:my_music_code/MyPlaylists/playlist_widgets.dart';
import 'package:my_music_code/Album/album_widgets.dart';

class UserPageOfPlaylists extends StatefulWidget {
  const UserPageOfPlaylists({super.key});

  @override
  State<UserPageOfPlaylists> createState() => _UserPageOfPlaylistsState();
}

class _UserPageOfPlaylistsState extends State<UserPageOfPlaylists> {
  bool _isBlurred = false;
  final TextEditingController _searchController = TextEditingController();
  List<PlaylistModel> playlists = [];
  List<AlbumModel> albums = [];
  List<Widget> playlistWidgets = [];
  List<Widget> albumWidgets = [];

  @override
  void initState() {
    super.initState();
    _initializePlaylists();
    _initializeAlbums();
    _searchController.addListener(_filterList);
  }

  int playlistNumber = 30;

  void _initializePlaylists() {
    playlists = List.generate(
      playlistNumber,
      (index) => PlaylistModel(
        name: 'Playlist $index',
        creator: 'Milenuda ${index + 1}',
      ),
    );
    playlistWidgets = PlaylistWidgets.generatePlaylistWidgets(context, playlists);
  }

  void _initializeAlbums() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteAlbumIds = prefs.getStringList('favoriteAlbums') ?? [];

    albums = await Future.wait(favoriteAlbumIds.map((id) async {
      try {
        final album = await universal.spotifyApi.albums.get(id);
        var pagesTracks = await universal.spotifyApi.albums.tracks(album.id!).first().asStream().first;

        return AlbumModel(
          id: album.id.toString(),
          name: album.name!,
          artist: album.artists!.map((artist) => artist.name).join(', '),
          image: album.images!.first.url!,
          songs: pagesTracks.items,
        );
      } catch (e) {
        return AlbumModel(
          id: id,
          name: 'Unknown Album',
          artist: 'Unknown Artist',
          image: DefaultPlaceholder.image,
        );
      }
    }));

    albumWidgets = AlbumWidgets.generateAlbumWidgets(context, albums);

    setState(() {});
  }

void _filterList() {
  setState(() {
    String query = _searchController.text.toLowerCase();

    // Filtrando as playlists
    List<PlaylistModel> filteredPlaylists = playlists.where((playlist) {
      return playlist.name.toLowerCase().contains(query) ||
          playlist.creator.toLowerCase().contains(query);
    }).toList();
    playlistWidgets = PlaylistWidgets.generatePlaylistWidgets(context, filteredPlaylists);

    // Filtrando os álbuns
    List<AlbumModel> filteredAlbums = albums.where((album) {
      return album.name.toLowerCase().contains(query) ||
          album.artist.toLowerCase().contains(query);
    }).toList();
    albumWidgets = AlbumWidgets.generateAlbumWidgets(context, filteredAlbums);
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(), 
                      Container(), 
                      ListView(children: albumWidgets), 
                      ListView(children: playlistWidgets), 
                    ],
                  ),
                ),
              ],
            ),
            if (_isBlurred)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () => _showBlurDialog(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
