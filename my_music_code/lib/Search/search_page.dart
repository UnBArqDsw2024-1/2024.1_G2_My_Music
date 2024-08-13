// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Search', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de Busca
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
            
            // Recently Played
            Text('Recently Played', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentlyPlayedItem('The triangle', 'assets/triangle.jpg'),
                  _buildRecentlyPlayedItem('StarBoy', 'assets/starboy.jpg'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
            SizedBox(height: 20),

            // Artistas
            Text('Artists', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildArtistItem('Eminem', 'assets/eminem.jpg'),
                  _buildArtistItem('The Weekend', 'assets/weekend.jpg'),
                  // Adicione mais itens aqui
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildArtistItem(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 40,
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
