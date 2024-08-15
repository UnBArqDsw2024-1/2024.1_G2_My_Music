// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/music_page.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Profile/profile_drawer.dart';
import 'package:my_music_code/Search/Components/filter_item.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/Components/feed_profile_app_bar.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Search/search_page_terms.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.albumReleases, required this.recentMusics});
  final List<AlbumModel> albumReleases;
  final List<Music> recentMusics;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedFilter = 'Todos'; // Filtro padrão

  Map<String, List<dynamic>> mapaDeResposta = {
    "Música": [],
    // "Playlist": [],
    // "Artista": [],
    "Álbum": [],
  };

  setData() {
    setState(() {
      mapaDeResposta["Música"] = widget.recentMusics;
      mapaDeResposta["Álbum"] = widget.albumReleases;
    });
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  Widget listBuilder(List<dynamic> reciever, {String title = "Placeholder"}) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
        Container(
          constraints: BoxConstraints(minHeight: 170),
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.from(reciever.map((element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RawMaterialButton(
                      constraints: BoxConstraints(),
                      onPressed: () {
                        if (element is Music) {
                          showModalBottomSheet(
                              useRootNavigator: false,
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return MusicPage(music: element);
                              });
                        } else if (element is AlbumModel) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyAlbumPage(album: element)));
                        }
                      },
                      child: SizedBox(
                        width: 130,
                        child: SpacedColumn(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Container(
                              width: 130,
                              height: 157,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(element is Music ? element.imageUrl : element.image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text(element.name, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ))),
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
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  RawMaterialButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPageTerms())),
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
                      )),

                  // Filtros
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        PopupMenuButton<String>(
                            color: Color(0xFF373737),
                            onSelected: (String result) => setState(() => _selectedFilter = result),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                  for (String value in ["Todos"] + mapaDeResposta.keys.toList())
                                    PopupMenuItem<String>(
                                      value: value,
                                      child: FilterItem(
                                        text: value,
                                        selectedFilter: _selectedFilter,
                                      ),
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
                  ),
                ],
              ),
            ),

            // Recomendações
            SpacedColumn(
                padding: EdgeInsets.zero,
                spacing: 10,
                children: _selectedFilter == "Todos"
                    ? List.from(mapaDeResposta.entries.map((e) => listBuilder(e.value, title: e.key)))
                    : [listBuilder(mapaDeResposta[_selectedFilter]!, title: _selectedFilter)]),

            if (universal.currentMusic.name != null) Container(height: 180),
          ],
        )),
      ),
    );
  }
}
