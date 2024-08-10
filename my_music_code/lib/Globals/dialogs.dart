import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

Map<String,String> errorMap = {
  'channel-error':'preencha todos os campos!',
  'invalid-email':'email inválido!',
  'invalid-credential':'credenciais inválidas!',
  'weak-passowrd':'senha fraca!',
};

void errorDialogMessage(BuildContext context, String error, {String title = "Erro de autenticação"}){
  // Mostra a mensagem de erro
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        content: Text(error, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
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

void loadingDialog(BuildContext context, {Widget child = const Center(child: CircularProgressIndicator())}){
  showDialog(
    context: context,
    builder: (context) {
      return child;
    }
  );
}