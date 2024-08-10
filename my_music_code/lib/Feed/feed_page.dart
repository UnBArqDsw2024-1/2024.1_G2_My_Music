import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/music_playlist_feed_component.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, this.height, this.width, this.color, this.child, this.borderRadius, this.isCubic = false});
  final double? height;
  final double? width;
  final bool isCubic;
  final Color? color;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveFigmaHeight(height ?? 0),
      width: isCubic? responsiveFigmaHeight(width ?? 0): responsiveFigmaWidth(width ?? 0),
      decoration: BoxDecoration(color: color ?? backgroundColor, borderRadius: borderRadius ?? BorderRadius.zero),
      child: child ?? SizedBox(),
    );
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text("Feed", style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveContainer(
                width: double.infinity,
                height: responsiveFigmaHeight(275),
                color: backgroundColor,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MusicPlaylistFeedComponent(),
                      ResponsiveContainer(width: 10),
                      MusicPlaylistFeedComponent(),
                    ],
                  ),
                  ResponsiveContainer(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MusicPlaylistFeedComponent(),
                      ResponsiveContainer(width: 10),
                      MusicPlaylistFeedComponent(),
                    ],
                  ),
                  ResponsiveContainer(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MusicPlaylistFeedComponent(),
                      ResponsiveContainer(width: 10),
                      MusicPlaylistFeedComponent(),
                    ],
                  ),
                  ResponsiveContainer(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MusicPlaylistFeedComponent(),
                      ResponsiveContainer(width: 10),
                      MusicPlaylistFeedComponent(),
                    ],
                  ),
                ]),
              ),

              ResponsiveContainer(
                width: double.infinity,
                height: 210,
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ResponsiveContainer(
                            height: 60,
                            width: 60,
                            isCubic: true,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          ResponsiveContainer(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Novo lançamento",
                                  style: TextStyle(color: Color(0xff979797), fontSize: responsiveFigmaFontSize(12))),
                              Text("Artista",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: responsiveFigmaFontSize(16))),
                            ],
                          )
                        ],
                      ),
                      ResponsiveContainer(height: 18),
                      ResponsiveContainer(
                        height: 130,
                        width: 326,
                        color: DefaultPlaceholder.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                ResponsiveContainer(
                                  height: 130,
                                  width: 130,
                                  isCubic: true,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                                ),
                                ResponsiveContainer(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ResponsiveContainer(height: 12),
                                    Text("Minha música nova",
                                        style: TextStyle(color: Colors.white, fontSize: responsiveFigmaFontSize(16))),
                                    Text(
                                      "Single by DJ Onga",
                                      style: TextStyle(color: Color(0xff979797), fontSize: responsiveFigmaFontSize(12)),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                iconSize: 36,
                                onPressed: (){}, 
                                icon: Icon(Icons.play_arrow_rounded, color: secondaryColor,size: 36,),
                              )
                            )
                          ],
                        
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ResponsiveContainer(height: 10),
              ResponsiveContainer(
                width: double.infinity,
                height: 134,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: responsiveFigmaWidth(23)),
                      child: Text("Top World Albuns",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: responsiveFigmaFontSize(16))),
                    ),
                    ResponsiveContainer(height: 8),
                    ResponsiveContainer(
                      height: 100,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ResponsiveContainer(width: 23),
                            for(int i = 0; i < 10; i++)
                              Padding(
                                padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                                child: ResponsiveContainer(
                                  height: 100,
                                  width: 100,
                                  isCubic: true,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              ResponsiveContainer(height: 10),

              ResponsiveContainer(height: 10),
              ResponsiveContainer(
                width: double.infinity,
                height: 134,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: responsiveFigmaWidth(23)),
                      child: Text("Tocadas recentemente",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: responsiveFigmaFontSize(16))),
                    ),
                    ResponsiveContainer(height: 8),
                    ResponsiveContainer(
                      height: 100,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ResponsiveContainer(width: 23),
                            for(int i = 0; i < 5; i++)
                              Padding(
                                padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                                child: ResponsiveContainer(
                                  height: 100,
                                  width: 100,
                                  isCubic: true,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
