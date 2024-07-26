import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTapTogglePage});
  final Function()? onTapTogglePage;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: IconButton(
          onPressed: widget.onTapTogglePage,
          icon: Icon(Icons.person,color: Colors.white)
        ),
      ),
    );
  }
}

