import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/configuration_page.dart';
import 'package:my_music_code/Profile/friends_page.dart';
import 'package:my_music_code/legal/about_page.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key, required this.user});
  final User user;
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
              backgroundImage: CachedNetworkImageProvider(widget.user.photoURL ?? DefaultPlaceholder.image),
            ),
            title: ResponsiveText(text: widget.user.displayName, fontSize: 16),
            subtitle: ResponsiveText(
                text: "Configurar perfil",
                fontSize: 12,
                fontColor: Color(0xffA4A4A4)),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfigurationPage(user: widget.user))),
          ),
          ListTile(
            leading: Icon(Icons.add_rounded, color: Colors.white),
            title: ResponsiveText(text: "Trocar conta"),
            onTap: () => AuthService().signUserOut(),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: ResponsiveText(text: "Configurar Perfil"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfigurationPage(user: widget.user))),
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
