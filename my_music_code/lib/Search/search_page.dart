// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Search/search_page_terms.dart';

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
            RawMaterialButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SearchPageTerms())),
                  child: ResponsiveContainer(
                    height: 55,
                    width: double.infinity,
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    // ignore: deprecated_member_use
                                    child: Icon(Icons.search, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: 
                                      ResponsiveText(
                                        text: "Search song, playlist, artist...",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontColor: Colors.white,
                                      )
                                  )
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            )
                      
                      ),
              )),
            
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
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentlyPlayedItem('The triangle', 'assets/eminem.png'),
                  _buildRecentlyPlayedItem('StarBoy', 'assets/eminem.png'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
            SizedBox(height: 20),

            // Artistas
            Text('Artists', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildArtistItemWithBackground('Eminem', 'Artista','assets/eminem.png'),
                  SizedBox(width: 20),
                  _buildArtistItemWithBackground('The Weekend', 'Artista','assets/eminem.png'),
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
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // Borda arredondada
              image: DecorationImage(
                image: NetworkImage(DefaultPlaceholder.image), // Imagem de fundo
              )
            ),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildArtistItemWithBackground(String name, String item, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      color: primaryColor, // Cor de fundo
      borderRadius: BorderRadius.circular(8), // Borda arredondada
    ),
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(DefaultPlaceholder.image),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(color: Colors.white)),
        Text(item, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
}
