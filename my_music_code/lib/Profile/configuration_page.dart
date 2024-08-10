import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/change_password.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
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
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 85,
                  backgroundImage: NetworkImage(
                      DefaultPlaceholder.image), // substitua pelo URL da imagem
                ),
                Positioned(
                  bottom: 0,
                  right: -15,
                  child: IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () async {
                      // await ImagePiker().pickImage(source: ImageSource.gallery);
                    },
                  ),
                ),
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
                padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 100),
              ),
              child: Text('Mudar senha',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              onPressed: () {
                changePassword(context); // Ação para mudar a senha
              },
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
