import 'package:my_music_code/Models/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> toggleFavoriteMusic(Music music) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? favoriteMusics = prefs.getStringList('favoriteMusics') ?? [];

  if (favoriteMusics.contains(music.id)) {
    favoriteMusics.remove(music.id);
  } else {
    favoriteMusics.add(music.id!);
  }

  await prefs.setStringList('favoriteMusics', favoriteMusics);
}

Future<bool> isFavoriteMusic(String? musicId) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? favoriteMusics = prefs.getStringList('favoriteMusics') ?? [];
  bool isFavorite = favoriteMusics.contains(musicId);
  return isFavorite;
}

