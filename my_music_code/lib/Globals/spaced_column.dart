import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/responsive_container.dart';

class SpacedColumn extends StatefulWidget {
  const SpacedColumn({super.key, required this.children, this.spacing, this.padding, this.mainAxisSize, this.crossAxisAlignment});
  final List<Widget> children;
  final double? spacing;
  final EdgeInsets? padding;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  State<SpacedColumn> createState() => _SpacedColumnState();
}

class _SpacedColumnState extends State<SpacedColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisSize: widget.mainAxisSize ?? MainAxisSize.min,
            children: List.generate(widget.children.length, (index) {
              return Column(
                children: [
                  widget.children[index],
                  if (index < widget.children.length - 1) ResponsiveContainer(height: widget.spacing ?? 16),
                ],
              );
            })));
  }
}
