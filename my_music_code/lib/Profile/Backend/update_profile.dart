import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/universal.dart' as universal;

updateFirebaseProfile(BuildContext context, {required String username, required String email}) async {
  try {
    try {
      if ((universal.user.displayName ?? universal.userModel.username) != username && username.isNotEmpty) {
        // ignore: avoid_print
        print("${universal.user.displayName} & $username");
        universal.user.updateDisplayName(username);
      }
    } catch (e) {
      errorDialogMessage(context, e.toString(), title: "Erro ao atualizar nome de usuário");
    }

    try {
      if (universal.user.email != email && email.isNotEmpty) {
        universal.user.verifyBeforeUpdateEmail(email);
      }
    } on FirebaseAuthException catch (e) {
      errorDialogMessage(context, errorMap[e.code] ?? e.code, title: "Erro ao atualizar email");
    } catch (e) {
      errorDialogMessage(context, e.toString(), title: "Erro ao atualizar email");
    }
    Navigator.pop(context);
  } catch (e) {
    // ignore: avoid_print
    print("Erro ao atualizar perfil: $e");
  }
}