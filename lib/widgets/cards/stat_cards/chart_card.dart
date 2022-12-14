/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/date_globals.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

///
class ChartCard extends StatefulWidget {
  ///
  const ChartCard({super.key, required this.value});

  ///
  final Value value;

  @override
  State<ChartCard> createState() => _ChartCardState();
}

///
class _ChartCardState extends State<ChartCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${formattedDate(mostRecentWeekday(DateTime.now(), 1))} - ${formattedDate(mostRecentWeekday(DateTime.now(), 1).add(const Duration(days: 6)))}",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: Defaults.padding.bottom),
          AspectRatio(
            aspectRatio: 1 / 1,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(
                  border: Border(
                    left: BorderSide(
                      width: 2,
                      color: Theme.of(context).iconTheme.color!,
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Theme.of(context).iconTheme.color!,
                    ),
                  ),
                ),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  drawHorizontalLine: false,
                ),
                maxY: 5,
                barGroups: [
                  for (var i = 0; i < 7; i++)
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        (i < widget.value.alignmentData.values.length)
                            ? BarChartRodData(
                                toY: widget.value.alignmentData.values
                                    .elementAt(i)
                                    .toDouble(),
                                width: 16,
                                color: Defaults.spectrum[widget
                                        .value.alignmentData.values
                                        .elementAt(i) /
                                    5],
                              )
                            : BarChartRodData(
                                toY: 0,
                                width: 16,
                              ),
                      ],
                    ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getBottomTitles,
                      reservedSize: 28,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getLeftTitles,
                      interval: 1,
                      reservedSize: 22,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///
Widget getLeftTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: Defaults.increment,
    child: Text(
      "${value.toInt()}",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
  );
}

///
Widget getBottomTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(
      days[value.toInt()].substring(0, 1),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
  );
}
