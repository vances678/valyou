import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/widgets/controls/buttons/primary_button.dart';
import 'package:valyou/widgets/controls/buttons/secondary_button.dart';
import 'package:valyou/widgets/controls/selectors/rating_selector.dart';

class CheckinSlide extends StatefulWidget {
  const CheckinSlide({
    super.key,
    required this.pageController,
    required this.onRatingChange,
    required this.ratings,
    required this.value,
    required this.isFirstSlide,
    required this.isLastSlide,
  });

  final PageController pageController;
  final Function(Map<String, int>) onRatingChange;
  final Map<String, int> ratings;
  final Value value;
  final bool isFirstSlide;
  final bool isLastSlide;

  @override
  State<CheckinSlide> createState() => _CheckinSlideState();
}

class _CheckinSlideState extends State<CheckinSlide>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: Defaults.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.value.name,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Defaults.increment),
          RatingSelector(
            maxRating: 5,
            onSelect: (rating) {
              if (widget.ratings.containsKey(widget.value.name)) {
                widget.ratings
                    .update(widget.value.referenceID!, (value) => rating);
              } else {
                widget.ratings.addAll({widget.value.referenceID!: rating});
              }
              widget.onRatingChange(widget.ratings);
            },
          ),
          const SizedBox(height: Defaults.increment * 2),
          PrimaryButton(
            onPressed: (!widget.isLastSlide)
                ? () {
                    widget.pageController.animateToPage(
                      widget.pageController.page!.toInt() + 1,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 400),
                    );
                  }
                : () {
                    Navigator.pop(context);
                    final DataRepository repository = DataRepository();
                    widget.ratings.forEach((id, rating) async {
                      Value updatedValue = await repository.getValue(id);
                      updatedValue.alignmentData.addAll(
                        {DateTime.now(): rating},
                      );
                      repository.updateValue(id, updatedValue);
                    });
                  },
            child: Text(
              (!widget.isLastSlide) ? "Continue" : "Finish",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: Defaults.increment * 2),
          (!widget.isFirstSlide)
              ? SecondaryButton(
                  onPressed: () {
                    widget.pageController.animateToPage(
                      widget.pageController.page!.toInt() - 1,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 400),
                    );
                  },
                  child: Text(
                    "Previous",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
