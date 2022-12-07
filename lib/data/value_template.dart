import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valyou/data/defaults.dart';

class ValueTemplate {
  final String name;
  final IconData icon;
  final List<Color> colors;
  String? referenceID;

  ValueTemplate({
    required this.name,
    required this.icon,
    required this.colors,
    this.referenceID,
  });

  factory ValueTemplate.fromSnapshot(DocumentSnapshot snapshot) {
    final valueTemplate =
        ValueTemplate.fromJson(snapshot.data() as Map<String, dynamic>);
    valueTemplate.referenceID = snapshot.reference.id;
    return valueTemplate;
  }

  factory ValueTemplate.fromJson(Map<String, dynamic> json) {
    List<Color> colors = [];
    Map<String, dynamic> map = json["colors"];
    map.forEach((k, v) => colors.add(Color(v)));
    return ValueTemplate(
      name: json["name"] as String,
      icon: Defaults.icons[json["icon"]] ?? Icons.question_mark_rounded,
      colors: colors,
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
    };
  }
}
