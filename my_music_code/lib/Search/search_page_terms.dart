// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:spotify/spotify.dart';

class SearchPageTerms extends StatefulWidget {
  const SearchPageTerms({super.key, required this.spotifyApi});
  final SpotifyApi spotifyApi;

  @override
  State<SearchPageTerms> createState() => _SearchPageTermsState();
}

class _SearchPageTermsState extends State<SearchPageTerms> {
  TextEditingController textEditingController = TextEditingController();
  String query = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: textEditingController,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              onSubmitted: (value) {
                getQuery(SpotifyApi spotify) async {
                  var results = await spotify.search.get(value).first(30);
                  List<Music> listResults = [];

               for (var pages in results) {
                  if (pages.items != null) {
                    for (var res in pages.items!) {
                      if (res is Track){
                          listResults.add(Music(
                            name: res.name!,
                            artist: res.artists!.first.name!,
                            imageUrl: res.album!.images!.first.url!,
                          ),
                        );
                      }
                    }
                  }    
                }
              }
                getQuery(widget.spotifyApi);
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Artista, álbum ou música...',
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Colors.black), // Ícone no final do campo
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Text('Buscas recentes',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildRecentlyPlayedItem(
                      'The triangle', 'Music', 'Eminem', 'assets/eminem.png'),
                  _buildRecentlyPlayedItem(
                      'StarBoy', 'Music', 'Eminem', 'assets/eminem.png'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyPlayedItem(
      String title, String type, String artist, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(width: 8),
          Expanded(
            // Usa o Expanded para que a coluna ocupe o espaço disponível
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white)),
                SizedBox(
                    height:
                        4), // Espaçamento entre o título e o texto adicional
                Row(
                  children: [
                    Text(type,
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text(' - ',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text(artist,
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
              color: Colors.white), // Ícone no canto direito
        ],
      ),
    );
  }
}
