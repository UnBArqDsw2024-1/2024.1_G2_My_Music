import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/spaced_column.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}