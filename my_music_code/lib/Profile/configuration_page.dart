// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/Backend/pick_image.dart';
import 'package:my_music_code/Profile/Backend/update_profile.dart';
import 'package:my_music_code/universal.dart' as universal;

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  String email = "";
  String username = "";

  getUserData() {
    setState(() {
      email = universal.user.email!;
      username = universal.user.displayName ?? universal.userModel.username;
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
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
        title: Text('Configurar Perfil', style: TextStyle(color: Colors.white, fontSize: 20)),
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
                  onTap: () async => pickImage(context),
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: backgroundColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            universal.user.photoURL ?? DefaultPlaceholder.image
                          ),
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
                      onPressed: () async => pickImage(context),
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
                                offset: Offset(0, 1), // changes position of shadow
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
              initialValue: username,
              onChanged: (value) => setState(() => username = value),
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
              initialValue: email,
              onChanged: (value) => setState(() => email = value),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff373737),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 100),
              ),
              child: Text('Mudar senha', style: TextStyle(color: Colors.white, fontSize: 13)),
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
              child: Text('Salvar perfil', style: TextStyle(color: Colors.white, fontSize: 13)),
              onPressed: () => updateFirebaseProfile(context, username: username, email: email)
            ),
          ],
        ),
      ),
    );
  }
}
