library universal;

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Models/sign_login_model.dart';
import 'package:spotify/spotify.dart' hide User;

AudioPlayer audioPlayer = AudioPlayer();
Music currentMusic = Music();
late User user;
late SpotifyApi spotifyApi;
List<Music> releaseListMusics = List.empty(growable: true);
List<Music> currentListMusic = List.empty(growable: true);
List<Music> currentListMusicShuffle = List.empty(growable: true);
SignLoginModel userModel = SignLoginModel();
AlbumModel currentAlbum = AlbumModel();