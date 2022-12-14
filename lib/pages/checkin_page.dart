/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'checkin_slide.dart';

///
class CheckinPage extends StatefulWidget {
  ///
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

///
class _CheckinPageState extends State<CheckinPage> {
  ///
  double? pageProgress;

  ///
  PageController pageController = PageController();

  ///
  int? totalPageNum;

  ///
  Map<String, int> ratings = {};

  @override
  Widget build(BuildContext context) {
    final DataRepository repository = DataRepository();
    repository.getValueStream();

    pageController.addListener(() {
      setState(() {
        pageProgress = pageController.page ?? 0;
      });
    });

    void onRatingChange(Map<String, int> newRatings) {
      setState(() {
        ratings = newRatings;
      });
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Defaults.colors.detail.withAlpha(50),
        elevation: 8,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close_rounded,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (pageProgress ?? 0) / ((totalPageNum ?? 0) - 1),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: repository.getValueStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                List<DocumentSnapshot>? documentSnapshot = snapshot.data?.docs;
                List<Value> values = (documentSnapshot != null)
                    ? documentSnapshot
                        .map((data) => Value.fromSnapshot(data))
                        .toList()
                    : [];
                totalPageNum = values.length;

                return PageView.builder(
                  itemCount: values.length,
                  pageSnapping: true,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return CheckinSlide(
                      pageController: pageController,
                      value: values[index],
                      isFirstSlide: (index == 0),
                      isLastSlide: (index == values.length - 1),
                      onRatingChange: onRatingChange,
                      ratings: ratings,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
