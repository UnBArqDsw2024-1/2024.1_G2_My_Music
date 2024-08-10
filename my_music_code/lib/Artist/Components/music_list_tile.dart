import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:my_music_code/Globals/responsive_container.dart';
import 'package:my_music_code/Globals/responsive_text.dart';
import 'package:my_music_code/Globals/size_config.dart';
import 'package:my_music_code/Globals/style.dart';

class MusicListTile extends StatefulWidget {
  const MusicListTile({super.key, this.index});
  final int? index;
  @override
  State<MusicListTile> createState() => _MusicListTileState();
}

class _MusicListTileState extends State<MusicListTile> {
  List<IconData> numericIcons = [
    MdiIcons.numeric1,
    MdiIcons.numeric2,
    MdiIcons.numeric3,
    MdiIcons.numeric4,
    MdiIcons.numeric5,
    MdiIcons.numeric6,
    MdiIcons.numeric7,
    MdiIcons.numeric8,
    MdiIcons.numeric9,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: responsiveFigmaHeight(8.0)),
      child: RawMaterialButton(
        constraints: BoxConstraints(),
        onPressed: () {},
        child: Row(
          children: [
            Icon(numericIcons[(widget.index ?? 0)], size: 32, color: Colors.white),
            ResponsiveContainer(width: 4),
            ResponsiveContainer(
              height: 36,
              width: 36,
              isCubic: true,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(image: NetworkImage(DefaultPlaceholder.image), fit: BoxFit.cover),
            ),
            ResponsiveContainer(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ResponsiveText(
                    text: "The Great Architect", 
                    fontSize: 14, 
                    fontWeight: FontWeight.w400, 
                    fontColor: Colors.white
                  ),
                  ResponsiveText(
                    text: "Music • Architect",
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    fontColor: Colors.white70
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.more_vert, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
