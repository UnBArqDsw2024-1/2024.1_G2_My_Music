// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:my_music_code/universal.dart' as universal;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> pickImage(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      XFile? res = await imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        await uploadImageToFirebase(context, File(res.path));
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

  Future<void> uploadImageToFirebase(BuildContext context, File image) async {
    String? imageUrl;

    try {
      Reference reference = FirebaseStorage.instance.ref().child("Images/${universal.user.uid}.png");
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