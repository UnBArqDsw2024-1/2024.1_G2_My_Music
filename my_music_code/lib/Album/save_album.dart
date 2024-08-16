import 'package:my_music_code/Models/album_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> toggleFavoriteAlbum(AlbumModel album) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? favoriteAlbums = prefs.getStringList('favoriteAlbums') ?? [];

  if (favoriteAlbums.contains(album.id)) {
    favoriteAlbums.remove(album.id);
  } else {
    favoriteAlbums.add(album.id!);
  }
  await prefs.setStringList('favoriteAlbums', favoriteAlbums);
}

Future<bool> isFavoriteAlbum(String? albumId) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? favoriteAlbums = prefs.getStringList('favoriteAlbums') ?? [];
  bool isFavorite = favoriteAlbums.contains(albumId);
  return isFavorite;
}

