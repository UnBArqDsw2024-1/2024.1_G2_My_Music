import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Auth/login_page.dart';
import 'package:my_music_code/Auth/signup_page.dart';
import 'package:my_music_code/Models/sign_login_model.dart';
import 'package:my_music_code/SpotifyApi/api_settings.dart';
import 'package:my_music_code/navigator_page.dart';
import 'package:spotify/spotify.dart' hide User;
import 'package:my_music_code/universal.dart' as universal;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;


  @override
  void initState() {
    setState(() {
      universal.userModel = SignLoginModel();
    });
    super.initState();
  }

  void togglePage() {
    setState(() => isLogin = !isLogin);
    setState(() => universal.userModel.creatingAccount = !universal.userModel.creatingAccount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !universal.userModel.creatingAccount) {
              SpotifyApiCredentials credentials = SpotifyApiCredentials(ApiSettings.clientId, ApiSettings.clientSecret);
              SpotifyApi spotifyApi = SpotifyApi(credentials);
              return NavigatorPage(
                user: snapshot.data!,
                spotifyApi: spotifyApi,
              );
            } else {
              return isLogin? LoginPage(onTapTogglePage: togglePage)
                  : SignUpPage(onTapTogglePage: togglePage);
            }
          },
        ),
      ),
    );
  }
}
