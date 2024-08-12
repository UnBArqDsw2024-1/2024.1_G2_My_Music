import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/navigator_page.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTapTogglePage});
  final Function()? onTapTogglePage;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  ResponsiveContainer(height: 14),
                  ResponsiveText(
                    text: "Criar conta",
                    fontColor: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Primeiro nome",
                    hintText: "Nome",
                    prefixIcon: MdiIcons.account,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Sobrenome",
                    hintText: "Sobrenome",
                    prefixIcon: MdiIcons.accountOutline,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Nome de usuário",
                    hintText: "Usuario.Exemplo",
                    prefixIcon: Icons.alternate_email_rounded,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "Usuario@gmail.com",
                    prefixIcon: Icons.email,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Senha",
                    hintText: "•"*10,
                    obscuringText: true,
                    obscuringCharacter: "•",
                    prefixIcon: MdiIcons.lock,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 14),
                  CustomTextField(
                    labelText: "Repetir senha",
                    hintText: "•"*10,
                    obscuringText: true,
                    obscuringCharacter: "•",
                    prefixIcon: MdiIcons.lockOutline,
                    hintTextColor: Color(0xff868080),
                    fillColor: Color(0xffFFFFFF),
                    leadingIconColor: Color(0xff000000),
                    selectedBorderColor: primaryColor,
                    inputTextColor: Color(0xff000000),
                  ),
                  ResponsiveContainer(height: 16),
                  
                  
                  
                  RawMaterialButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigatorPage())),
                    child: ResponsiveContainer(
                      height: 47,
                      width: 233,
                      color: Color(0xff252422),
                      borderRadius: BorderRadius.circular(10),
                      child: Center(child: ResponsiveText(text: "Criar conta",fontSize: 16,fontWeight: FontWeight.w500,)),
                    )
                  ),
                  ResponsiveContainer(height: 8),
                  TextButton(onPressed: widget.onTapTogglePage, child: ResponsiveText(text: "Você tem uma conta? Entre",fontColor: primaryColor,fontWeight: FontWeight.w700,fontSize: 16,)),
                  ResponsiveContainer(height: 16),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

