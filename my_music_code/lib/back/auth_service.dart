import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/front/globals.dart';

Map<String,String> errorMap = {
  'channel-error':'preencha todos os campos!',
  'invalid-email':'email inválido!',
  'invalid-credential':'credenciais inválidas!',
  'weak-passowrd':'senha fraca!',
};


class AuthService{
  // Basic Login & Sign
  Future<void> userLogin(
    TextEditingController emailController,
    TextEditingController passwordController,  
  ) async {
    // Login with email and password
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );
  }

  Future<void> userSign(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    TextEditingController usernameController,  
  ) async {
    // Cria usuários na base de dados
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );

    // Adiciona informações extras (username e futuramente outras informações)
    FirebaseFirestore.instance.collection("users").add({
      "username":usernameController.text,
      "email":emailController.text,
    });
  }


  void handleLogin(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    {
      String authType = 'login',
      TextEditingController? confirmPasswordController,
      TextEditingController? usernameController,
    }
  ){
    // Ícone de carregamento
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try{
      authType == 'login'
      ? userLogin(emailController, passwordController) 
      : userSign(emailController, passwordController, confirmPasswordController!, usernameController!);
    } catch(e){
      errorDialogMessage(context, errorMap.containsKey(e)? errorMap[e]! : e.toString());
      log(errorMap[e]!);
    } finally{
      Navigator.pop(context);
    }
  }

  // Logout & SignOut
  void userSignOut(){
    FirebaseAuth.instance.signOut();
  }
}