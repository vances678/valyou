/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/widgets/cards/custom_card.dart';
import 'package:valyou/widgets/charts/arc_chart.dart';

///
class ArcCard extends StatelessWidget {
  ///
  const ArcCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: Defaults.margin.copyWith(right: Defaults.margin.right / 2),
      child: CustomPaint(
        foregroundPainter: ArcChart(
          startColor: Defaults.colors.accentDark,
          endColor: Defaults.colors.accentLight,
        ),
        child: AspectRatio(
          aspectRatio: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.speed,
                    size: Defaults.increment * 3,
                  ),
                  const SizedBox(width: Defaults.increment / 2),
                  Text(
                    "72%",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                "Total Alignment",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
