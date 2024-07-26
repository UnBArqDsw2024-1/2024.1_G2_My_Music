import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music_code/front/Auth/login_page.dart';
import 'package:my_music_code/front/Auth/signup_page.dart';
import 'package:my_music_code/front/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  void togglePage() => setState(() => isLogin = !isLogin);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return MyHomePage();
            }
            else {
              return isLogin? LoginPage(onTapTogglePage: togglePage) : SignUpPage(onTapTogglePage: togglePage);
            }
          },
        ),
      ),
    );
  }
}