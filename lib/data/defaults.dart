import 'package:flutter/material.dart';

class Defaults {
  static double increment = 8;
  static EdgeInsets padding = EdgeInsets.all(increment * 2);
  static EdgeInsets margin = EdgeInsets.only(
    left: increment * 2,
    right: increment * 2,
    bottom: increment * (3 / 2),
    top: increment / 2,
  );
  static BorderRadius borderRadius = BorderRadius.circular(increment);
  static Border border = const Border();
  static BoxShadow shadow = BoxShadow(
    blurRadius: (increment),
    offset: Offset(0, increment),
    spreadRadius: increment / 4,
    color: colors.detailDark.withAlpha(20),
  );

  static Map<String, IconData> icons = {
    "favorite": Icons.favorite,
    "house": Icons.house_rounded,
    "thumb_up": Icons.thumb_up_rounded,
    "church": Icons.church_rounded,
    "music": Icons.music_note,
    "bank": Icons.account_balance,
    "book": Icons.menu_book,
    "sunny": Icons.sunny,
    "tub": Icons.bathtub_rounded,
    "question": Icons.question_mark_rounded,
  };

  // ignore: library_private_types_in_public_api
  static _Colors colors = _Colors(
    accent: const Color(0xff2788f7),
    accentLight: const Color(0xff00b7fb),
    accentDark: const Color(0xff0659f9),
    placeholder: const Color(0xffa0a3bd),
    detail: const Color(0xff6e7191),
    detailLight: const Color(0xffd9dbe9),
    detailDark: const Color(0xff262338),
    text: const Color(0xff14142b),
    background: const Color(0xfff7f7fc),
    backgroundLight: const Color(0xfffcfcfc),
    valueColors: [
      [
        const Color(0xffFF14BC),
        const Color(0xffE5051F),
      ],
      [
        const Color(0xffA26BFA),
        const Color(0xff4F06C6),
      ],
      [
        const Color(0xff00BAFF),
        const Color(0xff063EF9),
      ],
      [
        const Color(0xffA8AABD),
        const Color(0xff636682),
      ],
      [
        const Color(0xffFF66DF),
        const Color(0xffBB0099),
      ],
      [
        const Color(0xff0B62F5),
        const Color(0xff013FC9),
      ],
      [
        const Color(0xff45C342),
        const Color(0xff227733),
      ],
      [
        const Color(0xFFDDCC22),
        const Color(0xFFFF9944),
      ],
      [
        const Color(0xffaa55ee),
        const Color(0xff55aaee),
      ],
    ],
  );
}

class _Colors {
  _Colors({
    required this.accent,
    required this.accentLight,
    required this.accentDark,
    required this.placeholder,
    required this.detail,
    required this.detailLight,
    required this.detailDark,
    required this.text,
    required this.background,
    required this.backgroundLight,
    required this.valueColors,
  });
  final Color accent;
  final Color accentLight;
  final Color accentDark;
  final Color placeholder;
  final Color detail;
  final Color detailLight;
  final Color detailDark;
  final Color text;
  final Color background;
  final Color backgroundLight;
  final List<List<Color>> valueColors;
}
