library universal;

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';

AudioPlayer audioPlayer = AudioPlayer();
Music currentMusic = Music();
User? user;

