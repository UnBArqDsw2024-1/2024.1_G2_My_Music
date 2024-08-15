// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:my_music_code/universal.dart' as universal;
import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Search/search_page_terms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/spotify.dart' hide Offset;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedFilter = 'Música'; // Filtro padrão

  List<AlbumModel> topReleases = [];
  getRelAlbum(SpotifyApi spotify) async {
    var albumNewReleases = await spotify.search.get('new releases').first(15);
    for (var pages in albumNewReleases) {
      if (pages.items != null) {
        for (var album in pages.items!) {
          if (album is AlbumSimple) {
            var pagesTracks = await spotify.albums.tracks(album.id!).first().asStream().first;
            setState(() {
              topReleases.add(AlbumModel(
                  songs: pagesTracks.items,
                  name: album.name!,
                  id: album.id!,
                  artist: album.artists!.first.name!,
                  image: album.images!.first.url!
              ));
            });
          }
        }
      }
    }
  }

  @override
  void initState() {
    getRelAlbum(universal.spotifyApi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: feedProfileAppBar(),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawMaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPageTerms())),
                child: ResponsiveContainer(
                  height: 55,
                  width: double.infinity,
                  color: Color(0xFF373737),
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          // ignore: deprecated_member_use
                          child: Icon(Icons.search, color: const Color.fromRGBO(255, 255, 255, 0.6)),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Center(
                              child: ResponsiveText(
                            text: "Pesquisar música, playlist, artista...",
                            //fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontColor: const Color.fromRGBO(255, 255, 255, 0.6),
                          ))),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  )),
                )),

            SizedBox(height: 5),
            // Filtros
            Row(
              children: [
                PopupMenuButton<String>(
                    color: Color(0xFF373737),
                    onSelected: (String result) {
                      setState(() {
                        _selectedFilter = result;
                      });
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Música',
                            child: _buildFilterItem('Música'),
                          ),
                          PopupMenuItem<String>(
                            value: 'PlayList',
                            child: _buildFilterItem('PlayList'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Artista',
                            child: _buildFilterItem('Artista'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Álbum',
                            child: _buildFilterItem('Álbum'),
                          ),
                        ],
                    child: Card(
                        color: Color(0xFF373737),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Define o raio das bordas
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/Filter.svg'),
                              SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                              Text('Filtros', style: TextStyle(color: Colors.white)), // Texto
                            ],
                          ),
                        ))),
                SizedBox(width: 15),
                Text(
                  'Filtro selecionado: $_selectedFilter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // Recently Played
            if(_selectedFilter == "Música")
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Músicas Recentes', style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(height: 20),
                Container(
                  height: 170,
                  constraints: BoxConstraints(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.from(
                        topReleases.map(
                          (element) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 136,
                                  height: 157,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        element.image,
                                      ), 
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Recently Played
            Text('Playlist Recentes', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20),
            Container(
              height: 170,
              constraints: BoxConstraints(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.from(
                    topReleases.map(
                      (element) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 136,
                              height: 157,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    element.image,
                                  ), 
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Recently Played
            Text('Artista Recentes', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20),
            Container(
              height: 170,
              constraints: BoxConstraints(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.from(
                    topReleases.map(
                      (element) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 136,
                              height: 157,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    element.image,
                                  ), 
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Recently Played
            Text('Album Recentes', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20),
            Container(
              height: 170,
              constraints: BoxConstraints(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.from(
                    topReleases.map(
                      (element) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 136,
                              height: 157,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    element.image,
                                  ), 
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        )),
      ),
    );
  }

  Widget _buildFilterItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: double.infinity,
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
}
