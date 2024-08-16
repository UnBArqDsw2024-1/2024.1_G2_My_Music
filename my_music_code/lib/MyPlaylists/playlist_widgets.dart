import 'package:flutter/material.dart';
import 'package:my_music_code/Models/playlist_model.dart';
import 'package:my_music_code/MyPlaylists/playlist_page.dart';
import 'package:my_music_code/Globals/style.dart';

class PlaylistWidgets {
  static List<Widget> generatePlaylistWidgets(
      BuildContext context, List<PlaylistModel> playlists) {
    return playlists.map((playlist) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPlaylistPage()),
            );
          },
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
                        image: NetworkImage(DefaultPlaceholder.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playlist.name,
                      style: TextStyle(
                        color: primaryFontColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      playlist.creator,
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
