import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintFontWeight = FontWeight.w400,
    this.hintTextColor = Colors.white70,
    this.prefixIcon,
    this.obscuringText = false,
    this.obscuringCharacter,
    this.hintText,
    this.enabled,
    this.horizontalPadding,
    this.onChanged,
    this.initialValue,
    this.fillColor,
    this.leadingIconColor,
    this.selectedBorderColor,
    this.inputTextColor,
    this.labelText,
    this.labelTextColor,
    this.labelTextFontWeight,
    this.cursorColor, this.focusedBorderWidth,
  });

  final void Function(String)? onChanged;
  final IconData? prefixIcon;
  final bool obscuringText;
  final String? obscuringCharacter;
  final String? hintText;

  final Color? leadingIconColor;
  final Color? selectedBorderColor;
  final Color? fillColor;
  final Color hintTextColor;
  final Color? inputTextColor;
  final Color? labelTextColor;
  final Color? cursorColor;

  final bool? enabled;
  final FontWeight hintFontWeight;
  final double? horizontalPadding;
  final String? initialValue;

  final double? focusedBorderWidth;

  final String? labelText;
  final FontWeight? labelTextFontWeight;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      setState(() {
        controller.text = widget.initialValue!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 0),
      child: TextField(
        // onChanged é uma função que é chamada toda vez que o texto do campo de texto é alterado
        onChanged: widget.onChanged,

        // enabled é um bool que decide se o campo de texto vai ser editável ou não
        enabled: widget.enabled ?? true,

        // Controlador do campo de texto, é utilizado para pegar o texto que o usuário digitou (backend)
        controller: controller,

        // Cor do cursor de texto (aquela barrinha que fica piscando indicando onde o texto vai ser digitado)
        cursorColor: widget.cursorColor ?? primaryColor,
        cursorWidth: 2,

        decoration: InputDecoration(
          // Label é o texto que indica o titulo desse campo de texto, por exemplo na tela de login no primeiro campo de texto a label é "Primeiro nome"
          labelStyle: TextStyle(
            color: widget.labelTextColor ?? Colors.black,
            fontWeight: widget.labelTextFontWeight ?? FontWeight.w400,
          ),
          labelText: widget.labelText,

          // Cor do fundo do textField
          filled: true,
          fillColor: widget.fillColor ?? Colors.white,

          // Cor da bordinha que fica em volta do textField
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white12),
          ),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.selectedBorderColor ?? primaryColor, width: widget.focusedBorderWidth ?? 1),
          ),

          // Cor e icone que aparecem no canto esquerdo do textField
          prefixIcon:
              Icon(widget.prefixIcon ?? Icons.email_outlined, color: widget.leadingIconColor ?? backgroundColor),

          // HintText é o texto temporário que aparece dentro do textField, por exemplo na tela de login no primeiro campo de texto o hintText é "Nome"
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
            fontWeight: widget.hintFontWeight,
          ),
        ),

        // obscureText é um bool que decide se o texto vai ser ocultado ou não e obscuringCharacter é o caractere que vai ser usado para ocultar o texto (utilizado no campo password)
        obscureText: widget.obscuringText,
        obscuringCharacter: widget.obscuringCharacter ?? "•",

        // Cor do texto que o usuário digita
        style: TextStyle(
          color: widget.inputTextColor ?? Colors.black,
        ),
      ),
    );
  }
}
