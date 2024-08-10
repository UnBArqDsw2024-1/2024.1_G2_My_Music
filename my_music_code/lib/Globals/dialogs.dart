import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

Map<String, String> errorMap = {
  'channel-error': 'preencha todos os campos!',
  'invalid-email': 'email inválido!',
  'invalid-credential': 'credenciais inválidas!',
  'weak-passowrd': 'senha fraca!',
};

void errorDialogMessage(BuildContext context, String error, {String title = "Erro de autenticação"}) {
  // Mostra a mensagem de erro
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        content: Text(error, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok")),
        ],
      );
    }
  );
}

void forgotPassword(BuildContext context) {
    showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: const Color(0xff0F0F0F),
        title: Text("Recuperar Senha", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveText(text: "Insira o email associado a sua conta", fontColor: Color(0xffA4A4A4), fontSize: 12),
            ResponsiveContainer(height: 12),
            CustomTextField(onChanged: (e){}, hintText: 'Email', prefixIcon: Icons.email),
            ResponsiveContainer(height: 12),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                // onTap: () => AuthService().resetPassword(context: context, email: user.email),
                child: Container(
                  height: responsiveFigmaHeight(50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: ResponsiveText(
                    text: "Enviar email",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  );
}

void loadingDialog(BuildContext context, {Widget child = const Center(child: CircularProgressIndicator())}) {
  showDialog(
      context: context,
      builder: (context) {
        return child;
      });
}
