
import 'package:flutter/material.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Music/music_page.dart';

void showModalMusic(BuildContext context, {required Music music, bool isRandom = false, AlbumModel? album}) {
  showModalBottomSheet(
    useRootNavigator: false,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) => MusicPage(
      music: music,
      isRandom: isRandom,
      album: album,
    )
  );
}