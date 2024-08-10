import 'package:flutter/material.dart';
import 'package:my_music_code/Artist/Components/music_list_tile.dart';
import 'package:my_music_code/Globals/horizontal_scroll_component.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveContainer(
                height: 227.5+8,
                width: double.infinity,
                child: Stack(
                  children: [
                    ResponsiveContainer(
                      width: double.infinity,
                      height: 200,
                      color: Colors.white,
                      image: DecorationImage(image: NetworkImage("https://i.redd.it/jghv9x07prgc1.jpeg"), fit: BoxFit.cover),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0, left: 0,
                            child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white)),
                          ),
                          Positioned(
                            bottom: 9, left: 0, right: 0,
                            child: Column(
                              children: const [
                                ResponsiveText(text: "The Great Architect",fontSize: 16,fontWeight: FontWeight.bold,),
                                ResponsiveText(text: "Creator Of Universe", fontSize: 8,fontColor: Colors.white70,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 8,
                      right: 10,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: (){},
                        icon: ResponsiveContainer(
                          height: 55,
                          width: 55,
                          isCubic: true,
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(Icons.play_arrow_rounded, color: Colors.white,size: 64)
                        ),
                      ),
                    ),

                    Positioned(
                      left: responsiveFigmaWidth(12),
                      bottom: 0,
                      child: ResponsiveText(
                        text: "Músicas Populares",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.white,
                        padding: EdgeInsets.only(bottom: 6),
                      ),
                    ),
                  ],
                ),
              ),

              ResponsiveContainer(
                height: 4,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(12)),
                child: Column(
                  children: List.generate(5, (int index) => MusicListTile(index: index)),
                ),
              ),

              HorizontalScrollComponent(title: "Álbuns de The Great Architect", leftPadding: 14),
            ],
          ),
        ),
      ),
    );
  }
}