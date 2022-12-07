import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/widgets/cards/custom_card.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedBorderCard extends StatelessWidget {
  const DottedBorderCard({
    super.key,
    this.height = 64,
    this.text = "",
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Defaults.increment * 2),
      child: DottedBorder(
        color: Theme.of(context).dividerColor,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        dashPattern: <double>[Defaults.increment, Defaults.increment],
        strokeCap: StrokeCap.round,
        radius: const Radius.circular(4),
        child: CustomCard(
          shadow: const BoxShadow(color: Colors.transparent),
          height: height,
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              SizedBox(width: Defaults.increment * 2),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: Defaults.increment * 2),
              const Icon(
                Icons.add,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
