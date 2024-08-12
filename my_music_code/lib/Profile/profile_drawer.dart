import 'package:flutter/material.dart';
import 'package:my_music_code/Auth/auth_page.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/configuration_page.dart';
import 'package:my_music_code/Profile/friends_page.dart';
import 'package:my_music_code/legal/about_page.dart';

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
              radius: 25,
              backgroundImage: NetworkImage(DefaultPlaceholder.image),
            ),
            title: ResponsiveText(text: "Milena Baruc", fontSize: 16),
            subtitle: ResponsiveText(
                text: "Configurar perfil",
                fontSize: 12,
                fontColor: Color(0xffA4A4A4)),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfigurationPage())),
          ),
          ListTile(
            leading: Icon(Icons.add_rounded, color: Colors.white),
            title: ResponsiveText(text: "Trocar conta"),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage())),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: ResponsiveText(text: "Configurar Perfil"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfigurationPage())),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: ResponsiveText(text: "Amizades"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description, color: Colors.white),
            title: ResponsiveText(text: "Sobre"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
            },
          ),
        ],
      ),
    );
  }
}
