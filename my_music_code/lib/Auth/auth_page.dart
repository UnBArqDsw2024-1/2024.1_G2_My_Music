import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Auth/login_page.dart';
import 'package:my_music_code/Auth/signup_page.dart';
import 'package:my_music_code/Globals/navigator_page.dart';
import 'package:my_music_code/SpotifyApi/api_settings.dart';
import 'package:spotify/spotify.dart' hide User;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  SignLoginModel userModel = SignLoginModel();

  bool isLogin = true;

  void togglePage() {
    setState(() => isLogin = !isLogin);
    setState(() => userModel.creatingAccount = !userModel.creatingAccount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !userModel.creatingAccount) {
              SpotifyApiCredentials credentials = SpotifyApiCredentials(ApiSettings.clientId, ApiSettings.clientSecret);
              SpotifyApi spotify = SpotifyApi(credentials);
              return NavigatorPage(user: snapshot.data!, spotify: spotify);
            } else {
              return isLogin? LoginPage(userModel: userModel, onTapTogglePage: togglePage) : SignUpPage(userModel: userModel, onTapTogglePage: togglePage);
            }
          },
        ),
      ),
    );
  }
}
