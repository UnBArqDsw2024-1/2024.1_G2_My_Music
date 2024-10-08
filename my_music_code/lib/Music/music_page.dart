import 'package:my_music_code/Music/save_music.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Music/Components/modal_music.dart';
import 'package:my_music_code/Music/Components/music_options_modal.dart';
import 'package:my_music_code/Music/back/setup_music.dart';
import 'package:my_music_code/universal.dart' as universal;

class MusicPage extends StatefulWidget {
  const MusicPage({
    super.key,
    required this.music,
    this.isRandom = false,
    this.album,
  });
  final Music music;
  final bool isRandom;
  final AlbumModel? album;
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool isPlaying = false;
  bool isFavorite = false;
  List<Music> populatedListMusic = [];
  setCurrentMusic() {
    setState(() {
      if (universal.navigatorIndex == 1) {
        universal.navigatorIndex = 2;
      } else {
        universal.navigatorIndex++;
      }
      if (universal.currentMusic.imageUrl != widget.music.imageUrl || // Album Swap
          (universal.currentMusic.name != widget.music.name && universal.currentMusic.artist == widget.music.artist)) {
        universal.currentMusic = widget.music;
        isPlaying = !isPlaying;
        setupMusic();
      }
      if (widget.album != null) {
        universal.currentAlbum = widget.album!;
      }
      populatedListMusic = universal.currentListMusic.isEmpty
          ? universal.releaseListMusics
          : widget.isRandom
              ? universal.currentListMusicShuffle
              : universal.currentListMusic;
    });
  }

  // Future<void> checkIfFavorite() async {
  //   bool favoriteStatus = await isFavoriteMusic(widget.music.id);
  //   setState(() {
  //     isFavorite = favoriteStatus; 
  //   });
  // }
  musicDur() async {
    print("${await universal.audioPlayer.getCurrentPosition()} / ${await universal.audioPlayer.getDuration()}");
  }

  @override
  void initState() {
    // Verifica qual audio está tocando
    setCurrentMusic();
    super.initState();
  }

  onFav() async { 
    await toggleFavoriteMusic(widget.music);
    setState(() => isFavorite = !isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    print(universal.navigatorIndex);
    int indexListMusic = 0;
    if (universal.currentListMusic.isNotEmpty) {
      List<String> listNames = universal.currentListMusic.map((e) {
        return e.name!;
      }).toList();

      indexListMusic = listNames.indexOf(widget.music.name!);
    } else {
      List<String> listNames = universal.releaseListMusics.map((e) => e.name!).toList();

      if (!listNames.contains(widget.music.name!)) {
        universal.releaseListMusics.add(widget.music);
      }

      indexListMusic = listNames.indexOf(widget.music.name!);
      print(indexListMusic);
    }
    musicDur();
    universal.audioPlayer.onPlayerComplete.listen((event) {
      Navigator.pop(context);
      showModalMusic(context,
          music: populatedListMusic[(indexListMusic + 1) % populatedListMusic.length], isRandom: widget.isRandom);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(CupertinoIcons.chevron_down, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  universal.navigatorIndex--;
                });
              },
            ),
            centerTitle: true,
            backgroundColor: backgroundColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tocando agora',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  universal.currentMusic.artist!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon:
                    Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white),
                onPressed: () {
                  musicOptionsModalBottomSheet(
                    context,
                    music: universal.currentMusic,
                    onFav: onFav,
                  );
                },
              ),
            ]),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20), // Espaçamento entre a Row e a imagem
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                universal.currentMusic.imageUrl!,
                width: 340,
                height: 340,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre a imagem e a próxima Row
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          universal.currentMusic.name!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'By ${universal.currentMusic.artist!}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                      isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      size: 30,
                      color: isFavorite ? primaryColor : Colors.white),
                      onPressed: () async {
                        await toggleFavoriteMusic(widget.music);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                ),
              ],
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: StreamBuilder(
                  stream: universal.audioPlayer.onPositionChanged,
                  builder: (context, data) {
                    return ProgressBar(
                      progress: data.data ?? Duration(milliseconds: 0),
                      buffered: Duration(
                          milliseconds: universal.currentMusic.duration!),
                      onSeek: (duration) =>
                          universal.audioPlayer.seek(duration),
                      total: Duration(
                          milliseconds: universal.currentMusic.duration!),
                      progressBarColor: primaryColor,
                      baseBarColor: Colors.white.withOpacity(0.20),
                      bufferedBarColor: Colors.white.withOpacity(0.20),
                      thumbColor: primaryFontColor,
                      thumbRadius: 5.0,
                      thumbGlowRadius: 0,
                      barHeight: 3.0,
                      timeLabelTextStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    );
                  },
                )),
            SizedBox(
                height:
                    20), // Espaçamento entre a barra de progresso e os botões de controle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CupertinoIcons.backward_end_fill,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      print(indexListMusic);
                      Navigator.pop(context);
                      if (universal.navigatorIndex > 1) {
                        setState(() {
                          universal.navigatorIndex--;
                        });
                      }
                      showModalMusic(context,
                          music: populatedListMusic[(indexListMusic - 1) % populatedListMusic.length],
                          isRandom: widget.isRandom);
                    },
                  ),

                  SizedBox(
                      width: 20), // Espaçamento entre os botões de controle

                  RawMaterialButton(
                    constraints: BoxConstraints(),
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                      universal.audioPlayer.state == PlayerState.paused
                          ? universal.audioPlayer.resume()
                          : universal.audioPlayer.pause();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 48),
                    ),
                  ),

                  SizedBox(
                      width: 20), // Espaçamento entre os botões de controle

                  IconButton(
                    icon: Icon(CupertinoIcons.forward_end_fill,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      print("Tamanho: ${universal.releaseListMusics.length}\n");
                      Navigator.pop(context);
                      if (universal.navigatorIndex > 1) {
                        setState(() {
                          universal.navigatorIndex--;
                        });
                      }
                      showModalMusic(context,
                          music: populatedListMusic[(indexListMusic - 1) % populatedListMusic.length],
                          isRandom: widget.isRandom);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
