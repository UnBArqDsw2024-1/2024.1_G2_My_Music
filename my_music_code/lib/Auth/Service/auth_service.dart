import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/universal.dart' as universal;

Map<String, String> errorMap = {
  'channel-error': 'preencha todos os campos!',
  'invalid-email': 'email inválido!',
  'invalid-credential': 'credenciais inválidas!',
  'email-already-in-use': 'Este email já está em uso!',
  'weak-passowrd': 'senha fraca!',
  'different-password': 'senhas diferentes!',
  "missing-android-pkg-name":"erro no pacote Android.",
  "missing-continue-uri":"Uma URL de continuação deve ser fornecida.",
  "missing-ios-bundle-id":"erro no IOS bunde ID.",
  "invalid-continue-uri":"A URL de continuação fornecida é inválida.",
  "unauthorized-continue-uri":"A URL de continuação não está na lista de autorizados.",
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
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      if (universal.userModel.creatingAccount) {
        // Verifica se as não senhas são iguais
        if (universal.userModel.password != universal.userModel.confirmPassword) {
          if (context.mounted) Navigator.pop(context);
          if (context.mounted) errorDialogMessage(context, errorMap['different-password']!);
          return;
        }

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: universal.userModel.email, password: universal.userModel.password);
        await FirebaseAuth.instance.signOut();
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: universal.userModel.email, password: universal.userModel.password);
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
