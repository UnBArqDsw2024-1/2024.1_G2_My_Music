import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Album/album_page.dart';
import 'package:my_music_code/Feed/dialog_qrcode_music.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:my_music_code/universal.dart' as universal;

void musicOptionsModalBottomSheet(BuildContext context, {required Music music, required Function() onFav}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: secondaryColor,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    music.imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      music.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      music.artist!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              if (universal.currentAlbum.id != null)
                ListTile(
                  onTap: () {
                    if (universal.currentAlbum.id != null) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyAlbumPage(
                                    album: universal.currentAlbum,
                                  )));
                    } else {}
                  },
                  leading: Icon(CupertinoIcons.music_albums, color: Colors.white),
                  title: Text(
                    'Ver álbum da música',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ListTile(
                onTap: () {
                  errorDialogMessage(context, "Essa funcionalidade ainda não está disponível.", title: "Em breve...");
                },
                leading: Icon(Icons.bookmark_add_outlined, color: Colors.white),
                title: Text(
                  'Salvar música em playlist...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(CupertinoIcons.heart, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                    onFav();
                  },
                  title: Text(
                    'Favoritar música',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )),
              ListTile(
                leading: Icon(CupertinoIcons.arrowshape_turn_up_right, color: Colors.white),
                onTap: () async {
                  await Share.share("Ouça essa música:\n${universal.currentMusic.link!} \nVocê vai amar!");
                },
                title: Text(
                  'Compartilhar música',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.waveform, color: Colors.white),
                title: Text(
                  'Ver ID no MyMusic',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onTap: () =>
                    showDialog(context: context, builder: (context) => QrcodeGenerator(music: universal.currentMusic)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
