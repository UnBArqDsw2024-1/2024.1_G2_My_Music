import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_music_code/Auth/auth_page.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/firebase_options.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    WakelockPlus.enable();
    if(Platform.isAndroid || Platform.isIOS){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    return MaterialApp(
      title: 'MyMusic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: false,
      ),
      home: AuthPage(),
    );
  }
}
