import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.selectedFilter, required this.text});
  final String selectedFilter, text; // Filtro padrão
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: selectedFilter == text ? primaryColor : Colors.grey[900], // Cor de fundo mais escura
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
        border: Border.all(
          color: primaryColor, // Cor da borda
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white), // Cor do texto
      ),
    );
  }
}