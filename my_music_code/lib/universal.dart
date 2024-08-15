library universal;

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:spotify/spotify.dart' hide User;

AudioPlayer audioPlayer = AudioPlayer();
Music currentMusic = Music();
late User user;
late SpotifyApi spotifyApi;
List<Music> currentListMusic = List.empty(growable: true);
List<Music> currentListMusicShuffle = List.empty(growable: true);
SignLoginModel userModel = SignLoginModel();