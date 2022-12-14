/* 
A control for selecting colors
Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

/// A control for selecting colors
class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, this.onSelect});

  /// A list of colors to be shown in the color selector
  final List<List<Color>> colors;

  /// A function that is run on selection of a color
  final Function? onSelect;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

/// The state for the color selector
class _ColorSelectorState extends State<ColorSelector> {
  /// The index of the selected color
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
