import 'package:my_music_code/Globals/style.dart';
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