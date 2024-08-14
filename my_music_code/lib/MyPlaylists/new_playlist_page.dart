import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/MyPlaylists/playlist_page.dart';

class CreatePlaylistDialog extends StatelessWidget {
  const CreatePlaylistDialog({super.key});

 @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: authButtonBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dê um nome à sua nova PlayList',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: TextEditingController(
                      text: 'MyMusicPlaylist',
                    ),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: (Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPlaylistPage(),
                            ),
                          ); 
                        },
                        child: Text('Criar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
