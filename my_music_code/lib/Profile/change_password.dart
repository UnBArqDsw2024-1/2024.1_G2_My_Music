import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';

void changePassword(BuildContext context, User user) {
  // String password = "";
  String newPassword = "";
  String confirmNewPasssord = "";

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Text("Mudar Senha",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
            Positioned(
              top: -10,
              left: -10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
          ],
        ),
        content: SpacedColumn(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hintText: "Sua senha atual",
              hintTextColor: Colors.white.withOpacity(0.25),
              selectedBorderColor: secondaryColor,
              fillColor: secondaryColor,
              prefixIcon: Icons.email,
              leadingIconColor: Colors.white,
              inputTextColor: Colors.white,
              cursorColor: Colors.white,
              obscuringText: true,
            ),
            CustomTextField(
              hintText: "Nova senha",
              hintTextColor: Colors.white.withOpacity(0.25),
              selectedBorderColor: secondaryColor,
              fillColor: secondaryColor,
              prefixIcon: Icons.email,
              leadingIconColor: Colors.white,
              inputTextColor: Colors.white,
              cursorColor: Colors.white,
              obscuringText: true,
              onChanged: (value) {
                setState(() {
                  newPassword = value;
                });
              },
            ),
            CustomTextField(
              hintText: "Confirmar senha atual",
              hintTextColor: Colors.white.withOpacity(0.25),
              selectedBorderColor: secondaryColor,
              fillColor: secondaryColor,
              prefixIcon: Icons.email,
              leadingIconColor: Colors.white,
              inputTextColor: Colors.white,
              cursorColor: Colors.white,
              obscuringText: true,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff373737),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              child: Text('Confirmar',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
