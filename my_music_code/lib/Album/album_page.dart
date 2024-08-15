import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/music_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:my_music_code/Album/save_album.dart';
import 'package:spotify/spotify.dart';

class AlbumModel {
  final String? id;
  final String name;
  final String artist;
  final String image;
  final Iterable<TrackSimple>? songs;

  AlbumModel({
    this.id,
    this.name = "Playlist Name",
    this.artist = "Artista",
    this.image = DefaultPlaceholder.image,
    this.songs,
  });
}

class MyAlbumPage extends StatefulWidget {
  const MyAlbumPage({super.key, required this.album});
  final AlbumModel album;

  @override
  State<MyAlbumPage> createState() => _MyAlbumPageState();
}

class _MyAlbumPageState extends State<MyAlbumPage> {
  bool isPinned = true;
  bool isFavorite = false;


  // Carrega o status de favorito quando a página é aberta
  void _loadFavoriteStatus() async {
    isFavorite = await isFavoriteAlbum(widget.album.id);
    setState(() {});
  }

  populaAlbum() {
    setState(() {
      universal.currentListMusic = List.empty(growable: true);
      for (var music in widget.album.songs!) {
        universal.currentListMusic.add(Music(
          name: music.name,
          id: music.id,
          artist: music.artists!.first.name,
          imageUrl: widget.album.image,
          link: music.externalUrls!.spotify,
          duration: music.durationMs,
        ));
      };
    });
  }

  @override
  void initState() {
    populaAlbum();
    _loadFavoriteStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ResponsiveContainer(
                height: 40,
                width: 40,
                isCubic: true,
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
              ),
            ),
            pinned: isPinned,
            expandedHeight: responsiveFigmaHeight(260),
            backgroundColor: backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.album.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: backgroundColor,
                    ),
                  ),
                ],
              ),
              title: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${widget.album.name} \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.album.songs!.length} songs',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ResponsiveContainer(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await toggleFavoriteAlbum(widget.album);
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.shuffle,
                            color: Colors.white54,
                          ),
                        ),
                        ResponsiveContainer(width: 12),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: ResponsiveContainer(
                            height: 45,
                            width: 45,
                            isCubic: true,
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(100),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 38,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Music indexMusic = Music(
                      name: widget.album.songs!.elementAt(index).name,
                      id: widget.album.songs!.elementAt(index).id,
                      artist: widget.album.songs!.elementAt(index).artists!.first.name,
                      imageUrl: widget.album.image,
                      link: widget.album.songs!.elementAt(index).externalUrls!.spotify,
                      duration: widget.album.songs!.elementAt(index).durationMs,
                    );
                    showModalBottomSheet(
                      useRootNavigator: false,
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) => MusicPage(music: indexMusic),
                    );
                  },
                  title: ResponsiveText(
                    text: widget.album.songs!.elementAt(index).name,
                    fontSize: 18,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  subtitle: ResponsiveText(
                    text: widget.album.songs!.elementAt(index).artists!.first.name,
                    fontSize: 12,
                    fontColor: Colors.white54,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, color: Colors.white54),
                  ),
                );
              },
              childCount: widget.album.songs!.length,
            ),
          ),
        ],
      ),
    );
  }
}
