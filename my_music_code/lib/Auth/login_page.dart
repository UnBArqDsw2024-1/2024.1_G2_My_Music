import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTapTogglePage});
  final Function()? onTapTogglePage;
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: IconButton(
          onPressed: widget.onTapTogglePage,
          icon: Icon(Icons.login,color: Colors.white)
        ),
      ),
    );
  }
}