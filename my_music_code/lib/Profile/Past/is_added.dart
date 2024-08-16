import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class ToggleIconTile extends StatefulWidget {
  const ToggleIconTile({super.key, required this.title});
  final String title;
  @override
  State<ToggleIconTile> createState() => _ToggleIconTileState();
}

class _ToggleIconTileState extends State<ToggleIconTile> {
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(DefaultPlaceholder.image),
      ),
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: Icon(
          _isAdded ? Icons.check_circle : Icons.add_circle_outline_rounded,
          color: _isAdded ? Colors.green : Color(0xff373737),
        ),
        onPressed: () {
          setState(() {
            _isAdded = !_isAdded;
          });
        },
      ),
    );
  }
}