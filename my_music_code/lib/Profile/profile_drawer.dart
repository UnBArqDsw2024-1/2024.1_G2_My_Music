import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Models/album_model.dart';
import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/Models/sign_login_model.dart';
import 'package:my_music_code/Profile/configuration_page.dart';
// import 'package:my_music_code/Profile/friends_page.dart';
import 'package:my_music_code/legal/about_page.dart';
import 'package:my_music_code/universal.dart' as universal;

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});
  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(universal.user.photoURL ?? DefaultPlaceholder.image),
            ),
            title: ResponsiveText(text: universal.user.displayName ?? universal.userModel.username, fontSize: 16),
            subtitle: ResponsiveText(text: "Configurar perfil", fontSize: 12, fontColor: Color(0xffA4A4A4)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigurationPage())),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: ResponsiveText(text: "Configurar Perfil"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigurationPage())),
          ),
          ListTile(
            leading: Icon(Icons.description, color: Colors.white),
            title: ResponsiveText(text: "Sobre o projeto"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.arrow_left_circle, color: Colors.white),
            title: ResponsiveText(text: "Deslogar"),
            onTap: () {
              setState(() {
                universal.audioPlayer.stop();
                universal.audioPlayer = AudioPlayer();
                universal.currentMusic = Music();
                universal.releaseListMusics = List.empty(growable: true);
                universal.currentListMusic = List.empty(growable: true);
                universal.currentListMusicShuffle = List.empty(growable: true);
                universal.userModel = SignLoginModel();
                universal.currentAlbum = AlbumModel();
                universal.navigatorIndex = 0;
              });
              AuthService().signUserOut();
            },
          ),
        ],
      ),
    );
  }
}
