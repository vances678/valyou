// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/repository/data_repository.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/data/value_template.dart';
import 'package:valyou/widgets/sheets/add_value_sheet.dart';
import 'package:valyou/widgets/cards/value_cards/add_value_card.dart';
import 'package:valyou/widgets/cards/value_cards/dotted_border_card.dart';

class AddValuePage extends StatefulWidget {
  const AddValuePage({super.key});

  @override
  State<AddValuePage> createState() => _AddValuePageState();
}

class _AddValuePageState extends State<AddValuePage> {
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Defaults.colors.detail.withAlpha(50),
        elevation: 8,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: Defaults.increment * 2),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddValueSheet(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: DottedBorderCard(
                  height: 64,
                  text: "Custom Value",
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: repository.getValueTemplateStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LinearProgressIndicator();
                  }
                  return _buildAddValueCards(
                    context,
                    snapshot.data?.docs ?? [],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddValueCards(
      BuildContext context, List<DocumentSnapshot>? snapshot) {
    return Column(
      children: (snapshot != null)
          ? snapshot.map((data) => _buildAddValueCard(context, data)).toList()
          : [],
    );
  }

  Widget _buildAddValueCard(BuildContext context, DocumentSnapshot snapshot) {
    final valueTemplate = ValueTemplate.fromSnapshot(snapshot);
    return GestureDetector(
      onTap: () {
        repository.addValue(Value.fromTemplate(valueTemplate));
        Navigator.pop(context);
      },
      child: AddValueCard(
        title: valueTemplate.name,
        icon: valueTemplate.icon,
        colors: valueTemplate.colors,
      ),
    );
  }
}
