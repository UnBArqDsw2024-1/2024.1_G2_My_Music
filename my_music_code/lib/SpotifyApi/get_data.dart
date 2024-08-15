import 'dart:async';

import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:spotify/spotify.dart';
import 'package:my_music_code/universal.dart' as universal;

Future<List<AlbumModel>> getAlbumReleasesFromSpotifyApi() async {
  List<AlbumModel> albumList = [];
  var albumNewReleases = await universal.spotifyApi.search.get('new releases').first(15);
  Future(() => albumNewReleases).then((result) async {
    for (var pages in result) {
      if (pages.items == null) {
        continue;
      }

      for (var album in pages.items!) {
        if (album is AlbumSimple) {
          var pagesTracks = await universal.spotifyApi.albums.tracks(album.id!).first().asStream().first;
          albumList.add(AlbumModel(
              songs: pagesTracks.items,
              name: album.name!,
              id: album.id!,
              artist: album.artists!.map((artist) => artist.name).join(', '),
              image: album.images!.first.url!));
        } else {
          continue;
        }
      }
    }
  });
  return albumList;
}

Future<List<Music>> getRecentMusicsFromSpotifyApi() async {
  List<Music> musicList = [];
  var search = await universal.spotifyApi.search.get('musicas fair trade').first(30);
  for (var pages in search) {
    if (pages.items != null) {
      for (var music in pages.items!) {
        if (music is Track) {
          musicList.add(Music(
            name: music.name!,
            id: music.id!,
            artist: music.artists!.map((artist) => artist.name).join(', '),
            imageUrl: music.album!.images!.first.url!,
            link: music.externalUrls!.spotify!,
            duration: music.durationMs!,
          ));
        }
      }
    }
  }
  return musicList;
}

Future<Music> getMusicReleaseFromSpotifyApi() async {
  Music acMusic = Music();
  var newReleases = await universal.spotifyApi.search.get('lançamentos').first(15);
  for (var pages in newReleases) {
    if (pages.items != null) {
      for (var music in pages.items!) {
        if (music is Track) {
          acMusic = Music(
            name: music.name!,
            id: music.id!,
            artist: music.artists!.map((artist) => artist.name).join(', '),
            imageUrl: music.album!.images!.first.url!,
            link: music.externalUrls!.spotify!,
            duration: music.durationMs!,
          );
          return acMusic;
        }
      }
    }
  }
  return acMusic;
}
