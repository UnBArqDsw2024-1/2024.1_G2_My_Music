import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:my_music_code/Auth/Service/auth_service.dart';
import 'package:my_music_code/Globals/custom_text_field.dart';
import 'package:my_music_code/Globals/dialogs.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/universal.dart' as universal;

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
                child: Image(
                  image: AssetImage('assets/LogoMyMusic.png'), // Se precisar alterar a cor da imagem
                  width: 100, // Ou size dependendo de como deseja ajustar
                  height: 100,
                ),
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
                child: SpacedColumn(
                  padding: EdgeInsets.only(top: responsiveFigmaHeight(16)),
                  spacing: 14,
                  children: [
                    ResponsiveText(
                      text: "Criar conta",
                      fontColor: Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                    ),
                    CustomTextField(
                      labelText: "Nome de usuário",
                      hintText: "Username",
                      prefixIcon: MdiIcons.account,
                      hintTextColor: Color(0xff868080),
                      fillColor: Color(0xffFFFFFF),
                      leadingIconColor: Color(0xff000000),
                      selectedBorderColor: primaryColor,
                      inputTextColor: Color(0xff000000),
                      onChanged: (value) {
                        setState(() {
                          universal.userModel.username = value;
                        });
                      },
                    ),
                    CustomTextField(
                      labelText: "Email",
                      hintText: "Usuario@gmail.com",
                      prefixIcon: Icons.email,
                      hintTextColor: Color(0xff868080),
                      fillColor: Color(0xffFFFFFF),
                      leadingIconColor: Color(0xff000000),
                      selectedBorderColor: primaryColor,
                      inputTextColor: Color(0xff000000),
                      onChanged: (value) {
                        setState(() {
                          universal.userModel.email = value;
                        });
                      },
                    ),
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
                      onChanged: (value) {
                        setState(() {
                          universal.userModel.password = value;
                        });
                      },
                    ),
                    CustomTextField(
                      labelText: "Repetir senha",
                      hintText: "•" * 10,
                      obscuringText: true,
                      obscuringCharacter: "•",
                      prefixIcon: MdiIcons.lockOutline,
                      hintTextColor: Color(0xff868080),
                      fillColor: Color(0xffFFFFFF),
                      leadingIconColor: Color(0xff000000),
                      selectedBorderColor: primaryColor,
                      inputTextColor: Color(0xff000000),
                      onChanged: (value) {
                        setState(() {
                          universal.userModel.confirmPassword = value;
                        });
                      },
                    ),
                    SpacedColumn(
                      spacing: 8,
                      children: [
                        RawMaterialButton(
                            onPressed: () async {
                              AuthService().controlSignLogin(context: context);
                              widget.onTapTogglePage!();
                              Navigator.pop(context);
                              errorDialogMessage(context, "Conta criada com sucesso", title: "Atenção!");
                            },
                            child: ResponsiveContainer(
                              height: 47,
                              width: 233,
                              color: Color(0xff252422),
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                  child: ResponsiveText(
                                text: "Criar conta",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                            )),
                        TextButton(
                            onPressed: widget.onTapTogglePage,
                            child: ResponsiveText(
                              text: "Você tem uma conta? Entre",
                              fontColor: primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
