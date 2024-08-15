// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Profile/profile_drawer.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Search/search_page_terms.dart';
import 'package:spotify/spotify.dart' hide Offset;

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.selectedFilter, required this.text});
  final String selectedFilter, text; // Filtro padrão
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: selectedFilter == text ? primaryColor : Colors.grey[900], // Cor de fundo mais escura
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
        border: Border.all(
          color: primaryColor, // Cor da borda
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



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedFilter = 'Todos'; // Filtro padrão

  Map<String, List<dynamic>> mapaDeResposta = {
    "Música": [],
    "Playlist": [],
    "Artista": [],
    "Álbum": [],
  };

  getRelAlbum(SpotifyApi spotify) async {
    var albumNewReleases = await spotify.search.get('new releases').first(15);
    for (var pages in albumNewReleases) {
      if (pages.items != null) {
        for (var album in pages.items!) {
          if (album is AlbumSimple) {
            var pagesTracks = await spotify.albums.tracks(album.id!).first().asStream().first;
            setState(() {
              mapaDeResposta['Álbum']!.add(AlbumModel(
                  songs: pagesTracks.items,
                  name: album.name!,
                  id: album.id!,
                  artist: album.artists!.first.name!,
                  image: album.images!.first.url!));
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

  Widget listBuilder(List<dynamic> reciever, {String title = "Placeholder"}) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
        SizedBox(
          height: 170,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.from(
                reciever.map(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: 136,
                          height: 157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(element.image),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: feedProfileAppBar(),
        drawer: ProfileDrawer(),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão de pesquisa
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
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
                      )
                    ),
                              
                    // Filtros
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          PopupMenuButton<String>(
                            color: Color(0xFF373737),
                            onSelected: (String result) =>  setState(() => _selectedFilter = result),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                              for (String value in ["Todos",'Música', 'Playlist', 'Artista', 'Álbum'])
                                PopupMenuItem<String>(
                                  value: value,
                                  child: FilterItem(text: value,selectedFilter: _selectedFilter,),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.search, color: Colors.white),
                                    SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                                    Text('Filtros', style: TextStyle(color: Colors.white)), // Texto
                                  ],
                                ),
                              )
                            )
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Filtro selecionado: $_selectedFilter',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              // Recomendações
              SpacedColumn(
                padding: EdgeInsets.zero,
                spacing: 20,
                children: _selectedFilter == "Todos"? List.from(mapaDeResposta.entries.map((e) => listBuilder(e.value, title: e.key))) : [listBuilder(mapaDeResposta[_selectedFilter]!,title: _selectedFilter)]
              ),
            ],
          )
        ),
      ),
    );
  }
}
