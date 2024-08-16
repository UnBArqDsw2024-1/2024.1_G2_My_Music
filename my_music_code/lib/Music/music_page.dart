import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Music/back/setup_music.dart';
import 'package:my_music_code/universal.dart' as universal;

class MusicPage extends StatefulWidget {
  const MusicPage({
    super.key,
    required this.music,
    this.isRandom = false,
  });
  final Music music;
  final bool isRandom;
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool isPlaying = false;
  bool isFavorite = false;

  setCurrentMusic() {
    setState(() {
      if(
        universal.currentMusic.imageUrl != widget.music.imageUrl || // Album Swap
        (universal.currentMusic.name != widget.music.name &&
        universal.currentMusic.artist == widget.music.artist)
      ) {
        universal.currentMusic = widget.music;
        isPlaying = !isPlaying;
        setupMusic();
      }
    });
  }

  @override
  void initState() {
    // Verifica qual audio está tocando
    setCurrentMusic();
    super.initState();
  }

  void _musicOptionsModalBottomSheet(
      BuildContext context, String artista, String music, String coverAlbum, bool isFavorite) {
    showModalBottomSheet(
      context: context,
      backgroundColor: secondaryColor,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      coverAlbum,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      music,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      artista,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.bookmark, color: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                Text(
                  'Salvar música em playlist...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      size: 30, color: isFavorite ? primaryColor : Colors.white),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                SizedBox(width: 10.0),
                Text(
                  'Favoritar música',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.arrowshape_turn_up_right, color: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                Text(
                  'Compartilhar música',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.waveform, color: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                Text(
                  'Ver ID no MyMusic',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> listNames = universal.currentListMusic.map((e) {
      return e.name!;
    }).toList();

    int indexListMusic = listNames.indexOf(widget.music.name!);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(CupertinoIcons.chevron_down, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
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
                icon: Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white),
                onPressed: () {
                  _musicOptionsModalBottomSheet(
                    context,
                    universal.currentMusic.artist!,
                    universal.currentMusic.name!,
                    universal.currentMusic.imageUrl!,
                    isFavorite,
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
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
                  icon: Icon(isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      size: 30, color: isFavorite ? primaryColor : Colors.white),
                  onPressed: () {
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
                      buffered: Duration(milliseconds: universal.currentMusic.duration!),
                      onSeek: (duration) => universal.audioPlayer.seek(duration),
                      total:  Duration(milliseconds: universal.currentMusic.duration!),
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
            SizedBox(height: 20), // Espaçamento entre a barra de progresso e os botões de controle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CupertinoIcons.backward_end_fill, color: Colors.white, size: 30),
                    onPressed: () {
                      if (universal.currentListMusic.isNotEmpty) {
                        Navigator.pop(context);
                        showModalBottomSheet(
                            useRootNavigator: false,
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) => MusicPage(music: widget.isRandom? universal.currentListMusicShuffle[(indexListMusic - 1) % universal.currentListMusicShuffle.length] : universal.currentListMusic[(indexListMusic - 1) % universal.currentListMusic.length],
                            isRandom: widget.isRandom)
                          );
                      }
                    },
                  ),
      
                  SizedBox(width: 20), // Espaçamento entre os botões de controle
      
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
                      child:
                          Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white, size: 48),
                    ),
                  ),
      
                  SizedBox(width: 20), // Espaçamento entre os botões de controle
      
                  IconButton(
                    icon: Icon(CupertinoIcons.forward_end_fill, color: Colors.white, size: 30),
                    onPressed: () {
                      if (universal.currentListMusic.isNotEmpty) {
                        Navigator.pop(context);
                          showModalBottomSheet(
                            useRootNavigator: false,
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) => MusicPage(music: widget.isRandom? universal.currentListMusicShuffle[(indexListMusic + 1) % universal.currentListMusicShuffle.length] : universal.currentListMusic[(indexListMusic - 1) % universal.currentListMusic.length],
                            isRandom: widget.isRandom)
                          );
                      }
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