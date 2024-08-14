import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class PlaylistModel{
  final String name;
  final String image;
  final int songs;
  PlaylistModel({this.name = "Playlist Name",this.image = DefaultPlaceholder.image,this.songs = 40});
}

class MyPlaylistPage extends StatefulWidget {
  const MyPlaylistPage({super.key});
  @override
  State<MyPlaylistPage> createState() => _MyPlaylistPageState();
}

class _MyPlaylistPageState extends State<MyPlaylistPage> {
  bool isPinned = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                Navigator.pop(context);
              },
              icon: ResponsiveContainer(
                height: 40,
                width: 40,
                isCubic: true,
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white),
              ),
            ),
            pinned: isPinned,
            expandedHeight: responsiveFigmaHeight(260),
            backgroundColor: backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // Rich text com o nome da playlist e a quantidade de músicas
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(DefaultPlaceholder.image),fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    color: backgroundColor.withOpacity(0.25),
                  ),  
                ],
              ),
              title: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "Playlist Name\n",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  children: const [
                    TextSpan(text: '40 songs', style: TextStyle(fontSize: 12, color: Colors.white70,fontWeight: FontWeight.normal)),
                  ]
                ),
              )
              // background: ,  // Imagem de Fundo da Playlist 
            ),
          ),
          SliverToBoxAdapter(
            child: ResponsiveContainer(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border, color: Colors.white54),
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          highlightColor: Colors.transparent,
                          icon: Icon(Icons.shuffle, color: Colors.white54),
                        ),
                        ResponsiveContainer(width: 12),
                        IconButton(
                          onPressed: (){},
                          padding: EdgeInsets.zero,
                          icon: ResponsiveContainer(
                            height: 45,
                            width: 45,
                            isCubic: true,
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(100),
                            child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 38)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  onTap: (){},
                  title: ResponsiveText(text: 'Song $index',fontSize: 18,fontColor: Colors.white,fontWeight: FontWeight.w400,),
                  subtitle: ResponsiveText(text: 'Artist $index',fontSize: 12, fontColor: Colors.white54,fontWeight: FontWeight.w400,),
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.more_vert,color: Colors.white54),
                  ),
                );
              },
              childCount: 40,  // Número de músicas dentro da playlist
            ),
          ),
        ],

      )
    );
  }
}
