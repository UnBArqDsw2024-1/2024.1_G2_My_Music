import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class FeedMusicPage extends StatefulWidget {
  const FeedMusicPage({super.key});

  @override
  State<FeedMusicPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Musics', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(CupertinoIcons.chevron_down, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Column(
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
                    'Eminem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white),
                onPressed: () {
                  showAboutDialog(context: context); // Exemplo de ação
                },
              ),
            ],
          ),
          SizedBox(height: 20), // Espaçamento entre a Row e a imagem
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              'https://lastfm.freetls.fastly.net/i/u/770x0/74768435b4f70689863aa76f888d62a3.jpg',
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
                      'Venom',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'By Eminem',
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
                icon: Icon(CupertinoIcons.arrowshape_turn_up_right, size: 20, color: Colors.white),
                onPressed: () {
                  showAboutDialog(context: context); // Exemplo de ação
                },
              ),
              SizedBox(width: 8.0), // Espaçamento entre os botões
              IconButton(
                icon: Icon(CupertinoIcons.ellipsis, size: 20, color: Colors.white),
                onPressed: () {
                  showAboutDialog(context: context); // Exemplo de ação
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
                      icon: Icon(CupertinoIcons.pause_fill, color: Colors.white, size: 50),
                      onPressed: () {},
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