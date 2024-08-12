import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';

class SpacedColumn extends StatefulWidget {
  const SpacedColumn({super.key, required this.children, this.spacing, this.padding});
  final List<Widget> children;
  final double? spacing;
  final EdgeInsets? padding;

  @override
  State<SpacedColumn> createState() => _SpacedColumnState();
}

class _SpacedColumnState extends State<SpacedColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        children: List.generate(widget.children.length, (index){
          return Column(
            children: [
              widget.children[index],
              if(index < widget.children.length - 1)
                ResponsiveContainer(height: widget.spacing ?? 16),
            ],
          );
        })
      )
    );
  }
}
