import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

class AddValueCard extends StatelessWidget {
  const AddValueCard({
    super.key,
    required this.title,
    required this.icon,
    required this.colors,
  });
  final String title;
  final IconData icon;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 64,
      border: Border(left: BorderSide(width: 4, color: colors[0])),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) =>
                LinearGradient(colors: colors).createShader(bounds),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: Defaults.increment * 2),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: Defaults.increment * 2),
          const Icon(
            Icons.add,
            size: 32,
          ),
        ],
      ),
    );
  }
}
