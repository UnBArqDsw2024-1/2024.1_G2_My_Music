import 'package:my_music_code/Globals/style.dart';

class PlaylistModel{
  final String name;
  final String image;
  final String creator;
  final int songs;
  PlaylistModel({this.name = "Playlist Name",this.image = DefaultPlaceholder.image, this.creator = "creator", this.songs = 40});
}