/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/widgets/cards/custom_card.dart';
import 'package:valyou/data/defaults.dart';

///
class StatCard extends StatelessWidget {
  ///
  const StatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: Defaults.padding.copyWith(
        top: Defaults.padding.top / 2,
        bottom: Defaults.padding.bottom / 2,
      ),
      margin: Defaults.margin.copyWith(left: Defaults.margin.left / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Streak",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 0.5,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToLastDescent: true,
                  applyHeightToFirstAscent: false,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.electric_bolt,
                    size: Defaults.increment * 2,
                  ),
                  const SizedBox(width: Defaults.increment / 2),
                  Text(
                    "24 Days",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Todo",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 0.5,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToLastDescent: true,
                  applyHeightToFirstAscent: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.list_rounded,
                    size: Defaults.increment * 3,
                  ),
                  const SizedBox(width: Defaults.increment / 2),
                  Text(
                    "8 Actions",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
