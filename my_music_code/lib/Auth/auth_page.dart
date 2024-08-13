import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Auth/login_page.dart';
import 'package:my_music_code/Auth/signup_page.dart';
import 'package:my_music_code/Globals/navigator_page.dart';

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
              return NavigatorPage(user: snapshot.data!);
            } else {
              if (snapshot.hasData && userModel.creatingAccount) {
                togglePage();
              }
              return isLogin
                  ? LoginPage(userModel: userModel, onTapTogglePage: togglePage)
                  : SignUpPage(userModel: userModel, onTapTogglePage: togglePage);
            }
          },
        ),
      ),
    );
  }
}
