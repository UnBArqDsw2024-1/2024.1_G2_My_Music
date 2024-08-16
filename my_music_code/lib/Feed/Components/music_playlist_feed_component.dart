import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Music/Components/modal_music.dart';
import 'package:my_music_code/universal.dart' as universal;

class MusicPlaylistFeedComponent extends StatefulWidget {
  const MusicPlaylistFeedComponent(
      {super.key, this.backgroundColor = DefaultPlaceholder.backgroundColor, required this.music});
  final Music music;
  final Color backgroundColor;

  @override
  State<MusicPlaylistFeedComponent> createState() => _MusicPlaylistFeedComponentState();
}

class _MusicPlaylistFeedComponentState extends State<MusicPlaylistFeedComponent> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      onPressed: () {
        setState(() {
          universal.currentListMusic = List.empty();
        });
        showModalMusic(context, music: widget.music);
      },
      child: ResponsiveContainer(
        height: 60,
        width: 160,
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            ResponsiveContainer(
              height: 60,
              width: 60,
              isCubic: true,
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(widget.music.imageUrl ?? DefaultPlaceholder.image),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ResponsiveText(
                  text: widget.music.name ?? DefaultPlaceholder.title,
                  fontColor: Colors.white,
                  padding: EdgeInsets.only(left: responsiveFigmaWidth(5)),
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
