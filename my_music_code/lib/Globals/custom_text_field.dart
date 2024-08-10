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
    this.inputTextColor, this.labelText,
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

  final bool? enabled;
  final FontWeight hintFontWeight;
  final double? horizontalPadding;
  final String? initialValue;
  final String? labelText;
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
        onChanged: widget.onChanged,
        enabled: widget.enabled ?? true,
        controller: controller,
        cursorColor: primaryColor,
        cursorWidth: 2,
        decoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: widget.fillColor ?? Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white12),
          ),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          prefixIcon:
              Icon(widget.prefixIcon ?? Icons.email_outlined, color: widget.leadingIconColor ?? backgroundColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.selectedBorderColor ?? primaryColor, width: 2),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
            fontWeight: widget.hintFontWeight,
          ),
        ),
        obscureText: widget.obscuringText,
        obscuringCharacter: widget.obscuringCharacter ?? "•",
        style: TextStyle(
          color: widget.inputTextColor ?? Colors.black,
        ),
      ),
    );
  }
}
