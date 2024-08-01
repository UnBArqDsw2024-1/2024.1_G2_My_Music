import 'package:flutter/material.dart';
import 'package:my_music_code/front/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Profile',style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: backgroundColor,
      body: const Center(
        child: Icon(Icons.person,color: Colors.white),
      ),
    );
  }
}