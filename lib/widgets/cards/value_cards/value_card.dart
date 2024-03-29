/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

///
class ValueCard extends StatelessWidget {
  ///
  const ValueCard({
    super.key,
    required this.title,
    required this.icon,
    required this.colors,
  });

  ///
  final String title;

  ///
  final IconData icon;

  ///
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      border: Border(
          left: BorderSide(width: Defaults.increment / 2, color: colors[0])),
      child: (Row(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) =>
                LinearGradient(colors: colors).createShader(bounds),
            child: Icon(
              icon,
              color: Colors.white,
              size: Defaults.increment * 4,
            ),
          ),
          const SizedBox(width: Defaults.increment * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) =>
                        LinearGradient(colors: colors).createShader(bounds),
                    child: const Icon(
                      Icons.speed,
                      color: Colors.white,
                      size: Defaults.increment * 3,
                    ),
                  ),
                  const SizedBox(width: Defaults.increment / 2),
                  Text(
                    "89%",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: Defaults.increment * 2),
                  ShaderMask(
                    shaderCallback: (Rect bounds) =>
                        LinearGradient(colors: colors).createShader(bounds),
                    child: const Icon(
                      Icons.electric_bolt,
                      color: Colors.white,
                      size: Defaults.increment * 3,
                    ),
                  ),
                  const SizedBox(width: Defaults.increment / 2),
                  Text(
                    "24 Day Streak!",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          const Expanded(child: SizedBox(width: Defaults.increment * 2)),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: Defaults.increment * 3,
          ),
        ],
      )),
    );
  }
}
