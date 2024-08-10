import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_music_code/Globals/style.dart';

class MyPlaylistPage extends StatefulWidget {
  const MyPlaylistPage({super.key});

  @override
  State<MyPlaylistPage> createState() => _MyPlaylistPageState();
}

class _MyPlaylistPageState extends State<MyPlaylistPage> {
  bool _pinned = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Pop Songs'),  // Nome da Playlist escolhida
              // background: ,  // Imagem de Fundo da Playlist 
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: 
                  Text('40 Songs') // Aqui vai pegar o número de músicas dentro da playlist
              ),
            ),
          ),
        ],
      )
    );
  }
}
