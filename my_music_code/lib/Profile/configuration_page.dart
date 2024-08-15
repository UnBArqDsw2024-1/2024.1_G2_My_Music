// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/universal.dart' as universal;


class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  String email = "";
  String username = "";
  String password = "";
  
  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      XFile? res = await imagePicker.pickImage(source: ImageSource.gallery);

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
    String? imageUrl;
    
    try {
      Reference reference =
          FirebaseStorage.instance.ref().child("Images/${universal.user.uid}.png");
      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("O upload da imagem foi realizado com sucesso!"),
          ),
        );
      });
      imageUrl = await reference.getDownloadURL();
      universal.user.updatePhotoURL(imageUrl);
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
        child: SpacedColumn(
          spacing: 16,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    pickImage();
                  },
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: backgroundColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(universal.user.photoURL ?? DefaultPlaceholder.image),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: RawMaterialButton(
                      onPressed: () {
                        pickImage();
                      },
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
            CustomTextField(
              hintText: "Nome de usuário",
              hintTextColor: Colors.white.withOpacity(0.25),
              selectedBorderColor: secondaryColor,
              fillColor: secondaryColor,
              prefixIcon: Icons.alternate_email_rounded,
              leadingIconColor: Colors.white,
              inputTextColor: Colors.white,
              cursorColor: Colors.white,
              initialValue: universal.user.displayName,
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            CustomTextField(
              hintText: "Email",
              hintTextColor: Colors.white.withOpacity(0.25),
              selectedBorderColor: secondaryColor,
              fillColor: secondaryColor,
              prefixIcon: Icons.email,
              leadingIconColor: Colors.white,
              inputTextColor: Colors.white,
              cursorColor: Colors.white,
              initialValue: universal.user.email,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
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
                if (universal.user.displayName != username) {
                  universal.user.updateDisplayName(username);
                }
                if (universal.user.email != email) {
                  universal.user.verifyBeforeUpdateEmail(email);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
