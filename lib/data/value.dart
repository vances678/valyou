import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valyou/data/alignment_data.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/value_template.dart';

class Value {
  final String name;
  final IconData icon;
  final List<Color> colors;
  final List<AlignmentData>? alignmentData;
  String? referenceID;

  Value({
    required this.name,
    required this.icon,
    required this.colors,
    this.alignmentData,
    this.referenceID,
  });

  factory Value.fromSnapshot(DocumentSnapshot snapshot) {
    final value = Value.fromJson(snapshot.data() as Map<String, dynamic>);
    value.referenceID = snapshot.reference.id;
    return value;
  }

  factory Value.fromTemplate(ValueTemplate valueTemplate) =>
      Value.fromJson(valueTemplate.toJson());

  factory Value.fromJson(Map<String, dynamic> json) {
    List<Color> colors = [];
    Map<String, dynamic> map = json["colors"];
    map.forEach((k, v) => colors.add(Color(v)));
    return Value(
      name: json["name"] as String,
      icon: Defaults.icons[json["icon"]] ?? Icons.question_mark_rounded,
      colors: colors,
      alignmentData: json["alignmentData"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> colorMap = {};
    colors.asMap().forEach((key, value) {
      colorMap["$key"] = value.value;
    });
    return {
      "name": name,
      "icon": Defaults.icons.keys.firstWhere(
        (k) => Defaults.icons[k] == icon,
        orElse: (() => "question"),
      ),
      "colors": colorMap,
      "alignmentData": alignmentData,
    };
  }
}
