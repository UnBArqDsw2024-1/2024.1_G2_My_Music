import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/dialogs.dart';

Map<String, String> errorMap = {
  'channel-error': 'preencha todos os campos!',
  'invalid-email': 'email inválido!',
  'invalid-credential': 'credenciais inválidas!',
  'email-already-in-use': 'Este email já está em uso!',
  'weak-passowrd': 'senha fraca!',
  'different-password':'senhas diferentes!',
};

class SignLoginModel {
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool creatingAccount = false;
}

class AuthService {
  Future<void> controlSignLogin({
    required SignLoginModel userModel,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      if (userModel.creatingAccount) {
        // Verifica se as não senhas são iguais
        if(userModel.password != userModel.confirmPassword){
          if (context.mounted) Navigator.pop(context);
          if (context.mounted) errorDialogMessage(context, errorMap['different-password']!);
          return;
        }

        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
        
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.email, password: userModel.password);
      }
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
    }
  }

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
    }
  }

  Future<void> changePassword({
    required String password,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
    }
  }

  // Sign Out
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Delete User
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
