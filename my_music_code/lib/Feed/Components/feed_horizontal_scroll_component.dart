import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Globals/cubic_button_with_image.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Models/album_model.dart';

class FeedHorizontalScrollComponent extends StatefulWidget {
  const FeedHorizontalScrollComponent({super.key, required this.title, required this.albuns});
  final String title;
  final List<AlbumModel> albuns;

  @override
  State<FeedHorizontalScrollComponent> createState() => _FeedHorizontalScrollComponentState();
}

class _FeedHorizontalScrollComponentState extends State<FeedHorizontalScrollComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveFigmaHeight(10)),
      child: Container(
        constraints: BoxConstraints(minHeight: responsiveFigmaHeight(128), minWidth: double.infinity),
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
                  if (widget.albuns.isNotEmpty)
                    for (AlbumModel album in widget.albuns)
                      Padding(
                          padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                          child: CubicButtonWithImage(
                            onPressed: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => MyAlbumPage(album: album))),
                            image: NetworkImage(album.image),
                          )),
                  if (widget.albuns.isEmpty)
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.only(right: responsiveFigmaWidth(10)),
                        child: CubicButtonWithImage(
                          image: NetworkImage(DefaultPlaceholder.image),
                          onPressed: (){},
                        )
                      ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
