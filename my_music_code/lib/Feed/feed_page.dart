import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_horizontal_scroll_component.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Feed/Components/new_music_release.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/profile_drawer.dart';
import 'package:my_music_code/SpotifyApi/api_settings.dart';
import 'package:spotify/spotify.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<AlbumBase> topReleases = [];
  List<Music> recentMusics = [];
  Music musicRelease = Music();

  getRel(SpotifyApi spotify) async {
    print('\nNew Releases');
    var newReleases = await spotify.browse.newReleases().first();
    var search = await spotify.search.get('musicas fair trade').first(30);

    for (var album in newReleases.items!) {
      setState(() {
        topReleases.add(AlbumBase(
            name: album.name!,
            id: album.id!,
            artist: album.artists!.first.name!,
            imageUrl: album.images!.first.url!));
      });
    }

    for (var album in newReleases.items!) {
      if (album != Null) {
        setState(() {
          musicRelease = Music(
            name: album.name!,
            id: album.id!,
            artist: album.artists!.first.name!,
            imageUrl: album.images!.first.url!,
          );
        });
      }
    }

    // print(search);

    for (var pages in search) {
      if (pages.items != null) {
        // print(pages.items);
        for (var music in pages.items!) {
          if (music is Track) {
            setState(() {
              recentMusics.add(Music(
                  name: music.name!,
                  id: music.id!,
                  artist: music.artists!.first.name!,
                  imageUrl: music.album!.images!.first.url!));
            });
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    final credentials =
        SpotifyApiCredentials(ApiSettings.clientId, ApiSettings.clientSecret);
    final spotify = SpotifyApi(credentials);
    getRel(spotify);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: feedProfileAppBar(),
        drawer: ProfileDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FeedMusicGrid(listaDeMusicas: recentMusics),
              NewMusicRelease(
                musicRelease: musicRelease,
              ),
              FeedHorizontalScrollComponent(
                title: "Top World Albuns",
                albuns: topReleases,
              ),
              FeedHorizontalScrollComponent(
                title: "Tocadas recentemente",
                albuns: topReleases,
              ),
            ],
          ),
        ));
  }
}
