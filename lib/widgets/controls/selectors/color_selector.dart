import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, this.onSelect});

  final List<List<Color>> colors;
  final Function? onSelect;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var color in widget.colors)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Defaults.increment / 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = widget.colors.indexOf(color);
                    (widget.onSelect != null)
                        ? widget.onSelect!(selectedColorIndex)
                        : () {};
                  });
                },
                child: ClipOval(
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: color,
                      ),
                    ),
                    child: selectedColorIndex == widget.colors.indexOf(color)
                        ? const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
