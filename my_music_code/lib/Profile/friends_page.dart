import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/Components/query_result_widget.dart';
// import 'package:my_music_code/Profile/add_friend_page.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Seus Amigos',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  fillColor: secondaryColor,
                  leadingIconColor: Colors.white,
                  cursorColor: Colors.white,
                  prefixIcon: Icons.search,
                  hintText: "Pesquisar amigo",
                  hintTextColor: Colors.white24,
                  selectedBorderColor: Colors.transparent,
                  inputTextColor: Colors.white,
                  onChanged: (value) => setState(() => query = value),
                ),
              ),
              QueryResultWidget(
                query: query,
                friendsList: List.generate(30, (index) => "Amigo $index"),
              ),
              GestureDetector(
                onTap: () {
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff252525), borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
                  alignment: Alignment.center,
                  child: Text(
                    "Adicione um amigo",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryFontColor, fontWeight: FontWeight.w600, fontSize: 16)
                  ),
                ),
              ),
            ],
          )
        )
      );
  }
}

