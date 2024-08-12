import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_music_code/Globals/dialogs.dart';

Map<String, String> errorMap = {
  'channel-error': 'preencha todos os campos!',
  'invalid-email': 'email inválido!',
  'invalid-credential': 'credenciais inválidas!',
  'email-already-in-use': 'Este email já está em uso!',
  'weak-passowrd': 'senha fraca!',
};

class UserModel {
  String uid;
  String email;
  String firstName;
  String lastName;
  String photoURL;
  String password;

  UserModel({
    this.uid = '',
    this.email = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.photoURL = '',
  });
}

class AuthService {
  // Add User Details to Firestore
  Future<void> addUserDetailsToDB(UserModel user) async {
    FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'photoURL': user.photoURL,
    });
  }

  // Sign Up & Sign In
  signUpWithEmailAndPassword({
    required UserModel user,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password)
          .then((_) async {
        if (context.mounted) Navigator.pop(context);
        addUserDetailsToDB(user);
      });
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
      return null;
    }
  }

  Future<void> signInWithEmailAndPassword({
    required UserModel user,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
    }
  }

  // Change Information
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

  Future<void> changeProfile({
    required String firstName,
    required String lastName,
    required String username,
    required String photoURL,
    required String githubURL,
    required String githubUsername,
    required BuildContext context,
  }) async {
    try {
      loadingDialog(context);
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'photoURL': photoURL,
        'githubURL': githubURL,
        'githubUsername': githubUsername,
      });
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
