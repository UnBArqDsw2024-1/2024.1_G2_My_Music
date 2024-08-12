import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/cubic_button_with_image.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';

class AlbumBase {
  final String name;
  final String id;
  final String artist;
  final String imageUrl;

  AlbumBase({required this.name, required this.id, required this.artist, required this.imageUrl});
}




class FeedHorizontalScrollComponent extends StatefulWidget {
  const FeedHorizontalScrollComponent({super.key, required this.title, required this.albuns});
  final String title;
  final List<AlbumBase> albuns;

  @override
  State<FeedHorizontalScrollComponent> createState() => _FeedHorizontalScrollComponentState();
}

class _FeedHorizontalScrollComponentState extends State<FeedHorizontalScrollComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveFigmaHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
              text: widget.title,
              fontColor: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              padding: EdgeInsets.only(left: responsiveFigmaWidth(23))),
          ResponsiveContainer(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ResponsiveContainer(width: 23),

                for (AlbumBase album in widget.albuns)
                  Padding(
                    padding: EdgeInsets.only(right: responsiveFigmaWidth(10)), 
                    child: CubicButtonWithImage(
                      image: NetworkImage(album.imageUrl),
                    )
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
