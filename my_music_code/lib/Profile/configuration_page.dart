import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/change_password.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key, required this.user});

  final User user;

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  String email = "";
  String username = "";
  String password = "";
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage() async {
    try {
      Xfile? res = await imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        await uploadImageToFirebase(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Falha ao realizar o upload da imagem: $e"),
        ),
      );
    }
  }

  Future<void> uploadImageToFirebase(File image) async {
    try {
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Falha ao realizar o upload da imagem: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Ação para voltar
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('Configurar Perfil',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: GestureDetector(
          onTap: () async {
            pickImage(); // TODO : MUDA FOTO DE PERFIL AQUI
          },
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 85,
                    backgroundImage: NetworkImage(DefaultPlaceholder
                        .image), // substitua pelo URL da imagem
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: RawMaterialButton(
                        onPressed: () {},
                        constraints: BoxConstraints(),
                        shape: CircleBorder(),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white12,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ]),
                          alignment: Alignment.center,
                          child: Icon(Icons.filter_list, color: Colors.white),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: "Nome de usuário",
                hintTextColor: Colors.white.withOpacity(0.25),
                selectedBorderColor: secondaryColor,
                fillColor: secondaryColor,
                prefixIcon: Icons.alternate_email_rounded,
                leadingIconColor: Colors.white,
                inputTextColor: Colors.white,
                cursorColor: Colors.white,
                initialValue: widget.user.displayName,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: "Email",
                hintTextColor: Colors.white.withOpacity(0.25),
                selectedBorderColor: secondaryColor,
                fillColor: secondaryColor,
                prefixIcon: Icons.email,
                leadingIconColor: Colors.white,
                inputTextColor: Colors.white,
                cursorColor: Colors.white,
                initialValue: widget.user.email,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: "Primeiro nome",
                hintTextColor: Colors.white.withOpacity(0.25),
                selectedBorderColor: secondaryColor,
                fillColor: secondaryColor,
                prefixIcon: Icons.person,
                leadingIconColor: Colors.white,
                inputTextColor: Colors.white,
                cursorColor: Colors.white,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: "Sobrenome",
                hintTextColor: Colors.white.withOpacity(0.25),
                selectedBorderColor: secondaryColor,
                fillColor: secondaryColor,
                prefixIcon: Icons.person,
                leadingIconColor: Colors.white,
                inputTextColor: Colors.white,
                cursorColor: Colors.white,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 21.0, horizontal: 100),
                ),
                child: Text('Mudar senha',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onPressed: () => forgotPassword(context),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 69),
                ),
                child: Text('Salvar perfil',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onPressed: () {
                  // Ação para salvar perfil
                  if (widget.user.displayName != username) {
                    widget.user.updateDisplayName(username);
                  }
                  if (widget.user.email != email) {
                    widget.user.verifyBeforeUpdateEmail(email);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
