import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';

class Defaults {
  static const double increment = 8;
  static const EdgeInsets padding = EdgeInsets.all(increment * 2);
  static const EdgeInsets margin = EdgeInsets.only(
    left: increment * 2,
    right: increment * 2,
    bottom: increment * (3 / 2),
    top: increment / 2,
  );
  static const Border border = Border();
  static BorderRadius borderRadius = BorderRadius.circular(increment);
  static BoxShadow shadow = BoxShadow(
    blurRadius: increment,
    offset: const Offset(0, increment),
    spreadRadius: increment / 4,
    color: colors.detailDark.withAlpha(20),
  );

  static Rainbow spectrum = Rainbow(
    spectrum: [
      Colors.red[900]!,
      Colors.red,
      Colors.orange[700]!,
      Colors.yellow[600]!,
      Colors.limeAccent[700]!,
      Colors.greenAccent[400]!,
    ],
  );

  static const Map<String, IconData> icons = {
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
  static const _Colors colors = _Colors(
    accent: Color(0xff2788f7),
    accentLight: Color(0xff00b7fb),
    accentDark: Color(0xff0659f9),
    placeholder: Color(0xffa0a3bd),
    detail: Color(0xff6e7191),
    detailLight: Color(0xffd9dbe9),
    detailDark: Color(0xff262338),
    text: Color(0xff14142b),
    background: Color(0xfff7f7fc),
    backgroundLight: Color(0xfffcfcfc),
    valueColors: [
      [
        Color(0xffFF14BC),
        Color(0xffE5051F),
      ],
      [
        Color(0xffA26BFA),
        Color(0xff4F06C6),
      ],
      [
        Color(0xff00BAFF),
        Color(0xff063EF9),
      ],
      [
        Color(0xffA8AABD),
        Color(0xff636682),
      ],
      [
        Color(0xffFF66DF),
        Color(0xffBB0099),
      ],
      [
        Color(0xff0B62F5),
        Color(0xff013FC9),
      ],
      [
        Color(0xff45C342),
        Color(0xff227733),
      ],
      [
        Color(0xFFDDCC22),
        Color(0xFFFF9944),
      ],
      [
        Color(0xffaa55ee),
        Color(0xff55aaee),
      ],
    ],
  );
}

class _Colors {
  const _Colors({
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
