import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class FeedMusicPage extends StatefulWidget {
  const FeedMusicPage({super.key, 
    required this.music,
  });

  final Music music;

  @override
  State<FeedMusicPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedMusicPage> {
  bool isPlaying = false;
  bool isFavorite = false;

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
                  icon: Icon(CupertinoIcons.double_music_note, color: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                Text(
                  'Ver letra da música',
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
    return Scaffold(
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
                'Now playing',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.artista,
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
                  widget.artista,
                  widget.music,
                  widget.coverAlbum,
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
              widget.coverAlbum,
              width: 280,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20), // Espaçamento entre a imagem e a próxima Row
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.music,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'By ' + widget.artista,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
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
            child: ProgressBar(
              progress: Duration(milliseconds: 1000),
              buffered: Duration(milliseconds: 2000),
              total: Duration(milliseconds: 5000),
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
            ),
          ),
          SizedBox(height: 20), // Espaçamento entre a barra de progresso e os botões de controle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.backward_end_fill, color: Colors.white, size: 30),
                  onPressed: () {},
                ),

                SizedBox(width: 20), // Espaçamento entre os botões de controle

                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(isPlaying ? Icons.play_arrow_rounded : Icons.pause_rounded,
                          color: Colors.white, size: 50),
                    ),
                  ],
                ),

                SizedBox(width: 20), // Espaçamento entre os botões de controle

                IconButton(
                  icon: Icon(CupertinoIcons.forward_end_fill, color: Colors.white, size: 30),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
