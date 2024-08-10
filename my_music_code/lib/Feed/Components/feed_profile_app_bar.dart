import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';

PreferredSizeWidget feedProfileAppBar() {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: Builder(builder: (context) {
      return IconButton(
        icon: ResponsiveContainer(
          height: 30,
          width: 30,
          borderRadius: BorderRadius.circular(100),
          isCubic: true,
          image: DecorationImage(
            image: NetworkImage(DefaultPlaceholder.image),
          ),
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }),
    title: ResponsiveText(text: "Hi, Milena Baruc, let's play some music.", fontSize: 16),
  );
}