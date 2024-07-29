import 'package:flutter/material.dart';
import 'package:my_music_code/front/style.dart';

void errorDialogMessage(BuildContext context, String error, {String title = "Erro de autenticação"}){
  // Mostra a mensagem de erro
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(title, textAlign: TextAlign.center),
        content: Text(error, textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text("Ok")
          ),
        ],
      );
    }
  );
}