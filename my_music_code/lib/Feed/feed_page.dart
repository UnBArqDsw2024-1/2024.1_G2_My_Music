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
    var albumNewReleases =  await spotify.search.get('new releases').first(15);
    var newReleases = await spotify.search.get('lançamentos').first(15);
    var search = await spotify.search.get('musicas fair trade').first(30);

    for (var pages in albumNewReleases) {
      if (pages.items != null) {
        for (var album in pages.items!) {
          if (album is AlbumSimple) {
            setState(() {
              topReleases.add(AlbumBase(
                  listMusic: [],
                  name: album.name!,
                  id: album.id!,
                  artist: album.artists!.first.name!,
                  imageUrl: album.images!.first.url!));
            });
          }
        }
      }
    }

    for (var pages in newReleases) {
      if (pages.items != null) {  
        for (var music in pages.items!) {
          if (music is Track) {
            setState(() {
              musicRelease = Music(
                name: music.name!,
                id: music.id!,
                artist: music.artists!.first.name!,
                imageUrl: music.album!.images!.first.url!,
                link: music.externalUrls!.spotify!,
                duration: music.durationMs!,
              );
            });
          }
          break;
        }
      }
    }

    for (var pages in search) {
      if (pages.items != null) {
        for (var music in pages.items!) {
          if (music is Track) {
            setState(() {
              recentMusics.add(Music(
                  name: music.name!,
                  id: music.id!,
                  artist: music.artists!.first.name!,
                  imageUrl: music.album!.images!.first.url!,
                  link: music.externalUrls!.spotify!,
                  duration: music.durationMs!,
              ));
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
