import 'package:flutter/material.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Globals/style.dart';

class AlbumWidgets {
  static List<Widget> generateAlbumWidgets(
      BuildContext context, List<AlbumModel> albums) {
    return albums.map((album) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyAlbumPage(album: album)),
          ),
          splashColor: primaryColor.withOpacity(0.3),
          highlightColor: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(7.5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 7.5),
                  child: Container(
                    height: 105,
                    width: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(album.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.name,
                      style: TextStyle(
                        color: primaryFontColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      album.artist,
                      style: TextStyle(
                        color: secondaryFontColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
