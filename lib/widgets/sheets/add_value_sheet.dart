// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/data/value_template.dart';
import 'package:valyou/widgets/buttons/primary_button.dart';
import 'package:valyou/widgets/color_selector.dart';

class AddValueSheet extends StatefulWidget {
  const AddValueSheet({super.key});

  @override
  State<AddValueSheet> createState() => _AddValueSheetState();
}

class _AddValueSheetState extends State<AddValueSheet> {
  final DataRepository repository = DataRepository();

  final textController = TextEditingController();

  final List<IconData> icons = Defaults.icons.values.toList();
  final List<List<Color>> colors = Defaults.colors.valueColors;

  int _selectedIconIndex = 0;
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    IconData selectedIcon = icons[_selectedIconIndex];
    List<Color> selectedColor = colors[_selectedColorIndex];
    ColorSelector colorSelector = ColorSelector(
      colors: colors,
      onSelect: (index) => _selectedColorIndex = index,
    );

    return Container(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "Create Custom Value",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                //constraints: BoxConstraints(),
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close_rounded,
                  color: Defaults.colors.detail,
                  size: 32,
                ),
              ),
            ],
          ),
          Divider(color: Defaults.colors.detail),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Value name:",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextField(
                    controller: textController,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Defaults.colors.detail),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Color:",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Expanded(
                child: colorSelector,
              )
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Defaults.colors.detail),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Icon:",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  value: icons[_selectedIconIndex],
                  items: [
                    for (IconData icon in icons)
                      DropdownMenuItem(
                        value: icon,
                        child: Icon(icon),
                      )
                  ],
                  onChanged: (icon) {
                    setState(() {
                      _selectedIconIndex = icons.indexOf(icon!);
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          PrimaryButton(
            width: 200,
            onPressed: () {
              String? valueName = textController.text;
              if (valueName.isNotEmpty) {
                final newValueTemplate = ValueTemplate(
                  name: valueName,
                  icon: selectedIcon,
                  colors: selectedColor,
                );
                final newValue = Value(
                  name: valueName,
                  icon: selectedIcon,
                  colors: selectedColor,
                );
                repository.addValueTemplate(newValueTemplate);
                repository.addValue(newValue);
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Center(
              child: Text(
                "Create Value",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 40)
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
