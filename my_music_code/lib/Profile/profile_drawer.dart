import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/configuration_page.dart';
// import 'package:my_music_code/Profile/friends_page.dart';
import 'package:my_music_code/legal/about_page.dart';
import 'package:my_music_code/universal.dart' as universal;

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});
  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

Map<String, dynamic> tileMap = {
  "Configurar perfil": {
    "page": ConfigurationPage(),
    "icon": Icon(Icons.settings, color: Colors.white),
  },
  "Trocar conta": {
    "page": AuthService().signUserOut(),
    "icon": Icon(Icons.add_rounded, color: Colors.white),
  },
  "Sobre": {
    "page": AboutPage(),
    "icon": Icon(Icons.description, color: Colors.white),
  },
};

class _ProfileDrawerState extends State<ProfileDrawer> {
  ListTile listTileBuilder({required String title}) {
    return ListTile(
      leading: tileMap[title]["icon"],
      title: ResponsiveText(text: title),
      onTap: title == "Trocar conta"? 
        tileMap[title]["page"] : 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tileMap[title]["page"]),
        ),
    );
  }

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
            onTap: () => tileMap["Configurar Perfil"]["page"],
          ),
        ] +
        List.from(tileMap.keys.map((e) => listTileBuilder(title: e)).toList()),
      )
    );
  }
}
