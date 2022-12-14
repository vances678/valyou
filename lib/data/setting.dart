/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valyou/data/defaults.dart';

///
class Setting {
  ///
  final String name;

  ///
  final IconData icon;

  ///
  final Function? onTap;

  ///
  final Map<String, bool> options;

  ///
  String? referenceID;

  ///
  Setting({
    required this.name,
    required this.icon,
    required this.options,
    this.onTap,
    this.referenceID,
  });

  ///
  factory Setting.fromSnapshot(DocumentSnapshot snapshot) {
    final setting = Setting.fromJson(snapshot.data() as Map<String, dynamic>);
    setting.referenceID = snapshot.reference.id;
    return setting;
  }

  ///
  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      name: json["name"] as String,
      icon: Defaults.icons[json["icon"]] ?? Icons.question_mark_rounded,
      options: json["options"],
    );
  }

  ///
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "icon": Defaults.icons.keys.firstWhere(
        (k) => Defaults.icons[k] == icon,
        orElse: (() => "question"),
      ),
      "options": options,
    };
  }
}
