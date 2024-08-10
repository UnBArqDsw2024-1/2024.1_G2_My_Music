import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/navigator_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTapTogglePage});
  final Function()? onTapTogglePage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            ResponsiveContainer(
              height: 180,
              width: double.infinity,
              child: Icon(MdiIcons.music, color: Colors.white, size: 100),
            ),
            Expanded(
              child: Container(
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
                        onPressed: () => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => NavigatorPage())),
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
                    Expanded(child: ResponsiveContainer()),
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
              ),
            )
          ],
        ));
  }
}
