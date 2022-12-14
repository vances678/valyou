import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

class RatingSelector extends StatefulWidget {
  const RatingSelector({super.key, required this.maxRating, this.onSelect});

  final int maxRating;
  final Function(int)? onSelect;

  @override
  State<RatingSelector> createState() => _RatingSelectorState();
}

class _RatingSelectorState extends State<RatingSelector>
    with TickerProviderStateMixin {
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
                              fontSize: 20, fontWeight: FontWeight.w600),
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

class WavePainter extends CustomPainter {
  WavePainter({required this.waveWidthRatio});

  final double waveWidthRatio;

  @override
  void paint(Canvas canvas, Size size) {
    var spectrum = Rainbow(
      spectrum: [
        Colors.red[900]!,
        Colors.red,
        Colors.orange[700]!,
        Colors.yellow[700]!,
        Colors.limeAccent,
        Colors.lightGreenAccent,
        Colors.lightGreenAccent[700]!,
      ],
    );
    Paint paint = Paint()
      ..color = spectrum[waveWidthRatio]
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
