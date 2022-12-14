/* 
A control for selecting ratings
Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

/// A control for selecting ratings
class RatingSelector extends StatefulWidget {
  const RatingSelector({super.key, required this.maxRating, this.onSelect});

  /// The maximum numeric value of a rating
  final int maxRating;

  /// A function that is run on selection of a rating
  final Function(int)? onSelect;

  @override
  State<RatingSelector> createState() => _RatingSelectorState();
}

/// The state for the rating selector
class _RatingSelectorState extends State<RatingSelector>
    with TickerProviderStateMixin {
  /// The selected rating
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    List<int> ratings = List<int>.generate(widget.maxRating, (i) => i + 1);

    return CustomCard(
      borderRadius: BorderRadius.circular(1000),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: WavePainter(
                waveWidthRatio: selectedRating / widget.maxRating,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var rating in ratings)
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        selectedRating = ratings.indexOf(rating) + 1;
                        (widget.onSelect != null)
                            ? widget.onSelect!(selectedRating)
                            : () {};
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Center(
                        child: Text(
                          "$rating",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A custom painter that draws a "wave"-like selection rectangle
class WavePainter extends CustomPainter {
  WavePainter({required this.waveWidthRatio});

  /// The ratio of the control to be selected
  final double waveWidthRatio;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Defaults.spectrum[waveWidthRatio].withOpacity(0.75)
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    double waveWidth = (waveWidthRatio * size.width) - size.height / 2;
    path.lineTo(waveWidth, 0);
    path.arcToPoint(Offset(waveWidth, size.height),
        radius: Radius.circular(size.height / 2));
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
