import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/universal.dart' as universal;

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
          color: backgroundColor,
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              universal.user.photoURL ?? DefaultPlaceholder.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }),
    title: ResponsiveText(
      text: "Olá, ${universal.user.displayName ?? universal.userModel.username}, vamos ouvir uma música?.",
      fontSize: 16,
    )
  ); 
}
