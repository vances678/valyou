/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/date_globals.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/widgets/cards/custom_card.dart';
import 'package:valyou/widgets/cards/stat_cards/chart_card.dart';

///
class DetailsPage extends StatefulWidget {
  ///
  const DetailsPage({super.key, required this.value});

  ///
  final Value value;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

///
class _DetailsPageState extends State<DetailsPage> {
  ///
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Defaults.colors.detail.withAlpha(50),
        elevation: 8,
        title: Text(
          widget.value.name,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_rounded,
              color: Colors.redAccent,
            ),
            onPressed: () {
              repository.deleteValue(widget.value);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Defaults.padding.bottom),
            ChartCard(value: widget.value),
            for (var i = 0; i < 7; i++)
              if (i < widget.value.alignmentData.values.length)
                CustomCard(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          days[i],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          formattedDate(
                            mostRecentWeekday(DateTime.now(), 1).add(
                              Duration(days: i),
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: Defaults.borderRadius,
                            color: Defaults.spectrum[
                                widget.value.alignmentData.values.elementAt(i) /
                                    5],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Defaults.increment),
                            child: Text(
                              "${widget.value.alignmentData.values.elementAt(i)}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Defaults.colors.backgroundLight,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Defaults.padding.right),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          color: Colors.redAccent,
                          Icons.delete_rounded,
                          size: Defaults.increment * 3,
                        ),
                        onPressed: () {
                          Value newValue = widget.value;
                          newValue.alignmentData.remove(
                            newValue.alignmentData.keys.elementAt(i),
                          );
                          repository.updateValue(
                              newValue.referenceID!, newValue);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
            SizedBox(height: Defaults.padding.bottom * 10),
          ],
        ),
      ),
    );
  }
}
