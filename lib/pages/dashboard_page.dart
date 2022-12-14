/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/pages/add_value_page.dart';
import 'package:valyou/widgets/cards/stat_cards/arc_card.dart';
import 'package:valyou/widgets/cards/stat_cards/stat_card.dart';
import 'package:valyou/widgets/cards/value_cards/dotted_border_card.dart';
import 'package:valyou/widgets/cards/value_cards/value_card.dart';

///
class DashboardPage extends StatefulWidget {
  ///
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

///
class _DashboardPageState extends State<DashboardPage> {
  ///
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Defaults.increment * 2),
                child: Text(
                  "Dashboard",
                  style: GoogleFonts.poppins(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: const [
                    Expanded(
                      child: ArcCard(),
                    ),
                    Expanded(
                      child: StatCard(),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: repository.getValueStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const LinearProgressIndicator();
                  }
                  return _buildValueCards(
                    context,
                    snapshot.data?.docs ?? [],
                  );
                },
              ),
              GestureDetector(
                onTap: () => showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddValuePage();
                  },
                ),
                child: const DottedBorderCard(
                  text: "Add New Value",
                ),
              ),
              const SizedBox(
                height: Defaults.increment * 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _buildValueCards(
      BuildContext context, List<DocumentSnapshot>? snapshot) {
    return Column(
      children: (snapshot != null)
          ? snapshot.map((data) => _buildValueCard(context, data)).toList()
          : [],
    );
  }

  ///
  Widget _buildValueCard(BuildContext context, DocumentSnapshot snapshot) {
    final value = Value.fromSnapshot(snapshot);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "DetailsPage",
        arguments: value,
      ),
      child: ValueCard(
        title: value.name,
        icon: value.icon,
        colors: value.colors,
      ),
    );
  }
}
