import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/navigator_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTapTogglePage});
  final Function()? onTapTogglePage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

 Future signIn() async {
    try{
      loadingDialog(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) errorDialogMessage(context, errorMap[e.code] ?? e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveContainer(
                height: 180,
                width: double.infinity,
                child: Icon(MdiIcons.music, color: Colors.white, size: 100),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: SizeConfig.screenHeight - responsiveFigmaHeight(180),
                  minWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(27)),
                child: Column(
                  children: [
                    ResponsiveContainer(height: 16),
                    ResponsiveText(
                      text: "Login",
                      fontColor: Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                    ),
                    ResponsiveContainer(height: 16),
                    CustomTextField(
                      labelText: "Email",
                      hintText: "Usuario@gmail.com",
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      prefixIcon: Icons.alternate_email_rounded,
                      hintTextColor: Color(0xff868080),
                      fillColor: Color(0xffFFFFFF),
                      leadingIconColor: Color(0xff000000),
                      selectedBorderColor: primaryColor,
                      inputTextColor: Color(0xff000000),
                    ),
                    ResponsiveContainer(height: 16),
                    CustomTextField(
                      labelText: "Senha",
                      hintText: "•" * 10,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscuringText: true,
                      obscuringCharacter: "•",
                      prefixIcon: MdiIcons.lock,
                      hintTextColor: Color(0xff868080),
                      fillColor: Color(0xffFFFFFF),
                      leadingIconColor: Color(0xff000000),
                      selectedBorderColor: primaryColor,
                      inputTextColor: Color(0xff000000),
                    ),
                    ResponsiveContainer(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          forgotPassword(context);
                        },
                        child: ResponsiveText(
                          text: "Esqueceu a senha?",
                          fontColor: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ResponsiveContainer(height: 16),
                    RawMaterialButton(
                        onPressed: signIn,
                        child: ResponsiveContainer(
                          height: 47,
                          width: 233,
                          color: Color(0xff252422),
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                              child: ResponsiveText(
                            text: "Entrar",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                        )),
                    ResponsiveContainer(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Color(0xff000000),
                        )),
                        ResponsiveText(
                          text: "Ou continue com",
                          fontColor: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(8)),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color(0xff000000),
                        )),
                      ],
                    ),
                    ResponsiveContainer(height: 16),
                    RawMaterialButton(
                        onPressed: () => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => NavigatorPage())),
                        child: ResponsiveContainer(
                          height: 47,
                          width: 233,
                          color: Color(0xff252422),
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    // ignore: deprecated_member_use
                                    child: Icon(MdiIcons.google, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: ResponsiveText(
                                      text: "Login com o google",
                                      fontColor: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            )
                          ),
                        )
                      ),
                    ResponsiveContainer(height: 8),
                    TextButton(
                        onPressed: widget.onTapTogglePage,
                        child: ResponsiveText(
                          text: "Não possui uma conta? Registre-se",
                          fontColor: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )),
                    ResponsiveContainer(height: 16),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
