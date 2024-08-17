import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Music/music_page.dart';
import 'package:my_music_code/Models/music_model.dart';

class MusicWidgets {
  static List<Widget> generateMusicWidgets(
      BuildContext context, List<Music> musics) {
    return musics.map((music) {
      // Definindo valores padrão para campos que podem ser nulos
      final imageUrl = music.imageUrl ?? 'assets/images/placeholder.png'; 
      final name = music.name ?? 'Unknown Music';
      final artist = music.artist ?? 'Unknown Artist';

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicPage(music: music)),
          ),
          splashColor: primaryColor.withOpacity(0.3),
          highlightColor: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 70,
            padding: EdgeInsets.all(7.5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 7.5),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                        onError: (_, __) => AssetImage('assets/images/placeholder.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: primaryFontColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        artist,
                        style: TextStyle(
                          color: secondaryFontColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
