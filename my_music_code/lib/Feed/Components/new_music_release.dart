import 'package:flutter/material.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Music/Components/modal_music.dart';
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
                image: DecorationImage(image: NetworkImage(widget.musicRelease.imageUrl ?? DefaultPlaceholder.image)),
              ),
              ResponsiveContainer(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(text: "Novo lançamento", fontColor: Color(0xff979797), fontSize: 12),
                  ResponsiveText(
                      text: widget.musicRelease.artist ?? DefaultPlaceholder.title,
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
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(widget.musicRelease.imageUrl ?? DefaultPlaceholder.image)),
                    ),
                    ResponsiveContainer(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveContainer(height: 12),
                        ResponsiveText(text: "Música nova", fontColor: Colors.white, fontSize: 16),
                        ResponsiveText(
                          text: "By ${widget.musicRelease.artist ?? DefaultPlaceholder.title}",
                          fontColor: Color(0xff979797),
                          fontSize: 12,
                        )
                      ],
                    )
                  ],
                ),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: IconButton(
                      constraints: BoxConstraints(maxHeight: 55, maxWidth: 55),
                      iconSize: 36,
                      onPressed: () {
                        if(widget.musicRelease.id != null){
                          showModalMusic(context, music: widget.musicRelease);
                        }
                      },
                      icon: Container(
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.play_arrow_rounded, color: secondaryColor)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
