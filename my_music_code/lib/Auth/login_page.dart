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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTapTogglePage, required this.userModel});
  final Function()? onTapTogglePage;
  final SignLoginModel userModel;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                
                child: SpacedColumn(
                  spacing: 8,
                  children: [
                    SpacedColumn(
                      spacing: 16,
                      padding: EdgeInsets.only(top: responsiveFigmaHeight(16)),
                      children: [
                        ResponsiveText(
                          text: "Login",
                          fontColor: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 48,
                        ),

                        CustomTextField(
                          labelText: "Email",
                          hintText: "Usuario@gmail.com",
                          prefixIcon: Icons.alternate_email_rounded,
                          onChanged: (value) => setState(() => widget.userModel.email = value),
                        ),

                        CustomTextField(
                          labelText: "Senha",
                          hintText: "•" * 10,
                          obscuringText: true,
                          obscuringCharacter: "•",
                          prefixIcon: MdiIcons.lock,
                          onChanged: (value) => setState(() => widget.userModel.password = value),
                        ),
                      ],
                    ),

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

                    SpacedColumn(
                      padding: EdgeInsets.only(top: responsiveFigmaHeight(8)),
                      children: [
                        RawMaterialButton(
                          onPressed: () => AuthService().controlSignLogin(context: context, userModel: widget.userModel),
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
                              )
                            ),
                          )
                        ),


                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Divider(
                        //         color: Color(0xff000000),
                        //       )
                        //     ),
                        //     ResponsiveText(
                        //       text: "Ou continue com",
                        //       fontColor: primaryColor,
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 16,
                        //       padding: EdgeInsets.symmetric(horizontal: responsiveFigmaWidth(8)),
                        //     ),
                        //     Expanded(
                        //       child: Divider(
                        //         color: Color(0xff000000),
                        //       )
                        //     ),
                        //   ],
                        // ),
                        

                        TextButton(
                          onPressed: widget.onTapTogglePage,
                          child: ResponsiveText(
                            text: "Não possui uma conta? Registre-se",
                            fontColor: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )
                        ),
                  
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
  }
}
