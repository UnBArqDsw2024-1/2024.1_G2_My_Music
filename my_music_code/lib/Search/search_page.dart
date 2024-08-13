// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_music_code/Globals/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedFilter = 'Music'; // Filtro padrão

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF373737), // Cor da barra de status
      statusBarIconBrightness: Brightness.light, // Cor dos ícones da barra de status
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF373737),
        title: Text(
          'Busca',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Baumans',
            fontSize: 36.0
          )
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'O que você quer ouvir?',
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 0.6),
                fontSize: 16.0,
              ),
            ),
          )
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,

          
          children: [
          // Container cinza com bordas inferiores arredondadas e texto "Search"
            TextField(
              decoration: InputDecoration(
                hintText: 'Search song, playlist, artist...',
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            
            // Filtros

            Row(
              children: [
               PopupMenuButton<String>(
                onSelected: (String result) {
                  setState(() {
                    _selectedFilter = result;
                  });
                },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'Music',
                      child: _buildFilterItem('Music'),
                    ),
                    PopupMenuItem<String>(
                      value: 'PlayList',
                      child: _buildFilterItem('PlayList'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Artist',
                      child: _buildFilterItem('Artist'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Album',
                      child: _buildFilterItem('Album'),
                    ),
                  ],
                  child: Row(
                    children: [
                      Icon(Icons.filter_list, color: Colors.white), // Ícone
                      SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                      Text('Filters', style: TextStyle(color: Colors.white)), // Texto
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Selected: $_selectedFilter',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),    
            SizedBox(height: 20),


            // Recently Played
            Text('Recently Played', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentlyPlayedItem('The triangle', '../../assets/eminem.png'),
                  _buildRecentlyPlayedItem('StarBoy', '../../assets/eminem.png'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
            SizedBox(height: 20),

            // Artistas
            Text('Artists', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildArtistItemWithBackground('Eminem', 'Artista','../../assets/eminem.png'),
                  _buildArtistItemWithBackground('The Weekend', 'Artista','../../assets/eminem.png'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
          ],
          )
        ),
      ),
    );
  }

   Widget _buildFilterItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey[900], // Cor de fundo mais escura
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
        border: Border.all(
          color: Colors.purple, // Cor da borda
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white), // Cor do texto
      ),
    );
  }

  Widget _buildRecentlyPlayedItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildArtistItemWithBackground(String name, String item, String imagePath) {
  return Stack(
    alignment: Alignment.center,
    children: [
      // Retângulo de fundo
      Padding(
        padding: const EdgeInsets.only(right: 8.0), // Adiciona padding ao retângulo
        child: Container(
          width: 120,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 117, 3, 253), // Cor do fundo retangular
            borderRadius: BorderRadius.circular(15), // Borda arredondada opcional
          ),
        ),
      ),
      // Conteúdo circular
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(color: Colors.white)),
          Text(item, style: TextStyle(color: Colors.white)),
        ],
      ),
    ],
  );
}
}
