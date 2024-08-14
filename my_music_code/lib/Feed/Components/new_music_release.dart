import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Feed/feed_music_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';

class NewMusicRelease extends StatefulWidget {
  const NewMusicRelease({super.key, required this.musicRelease});
  final Music musicRelease;

  @override
  State<NewMusicRelease> createState() => _NewMusicReleaseState();
}

class _NewMusicReleaseState extends State<NewMusicRelease> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                image: DecorationImage(
                    image: NetworkImage(widget.musicRelease.imageUrl ??
                        DefaultPlaceholder.image)),
              ),
              ResponsiveContainer(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(
                      text: "Novo lançamento",
                      fontColor: Color(0xff979797),
                      fontSize: 12),
                  ResponsiveText(
                      text: widget.musicRelease.artist!,
                      fontWeight: FontWeight.w500,
                      fontColor: Colors.white,
                      fontSize: 16),
                ],
              )
            ],
          ),
          ResponsiveContainer(height: 12),
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
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(widget.musicRelease.imageUrl ??
                              DefaultPlaceholder.image)),
                    ),
                    ResponsiveContainer(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveContainer(height: 12),
                        ResponsiveText(
                            text: "Música nova",
                            fontColor: Colors.white,
                            fontSize: 16),
                        ResponsiveText(
                          text:
                              "Single by ${widget.musicRelease.artist ?? DefaultPlaceholder.title}",
                          fontColor: Color(0xff979797),
                          fontSize: 12,
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
                      onPressed: () {
                        showModalBottomSheet(
                        useRootNavigator: false,
                        isScrollControlled: true,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return FeedMusicPage();
                        });
                      },
                      icon: Icon(Icons.play_arrow_rounded,
                          color: secondaryColor, size: 36),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
