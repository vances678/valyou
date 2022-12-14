/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

///
class PrimaryButton extends StatelessWidget {
  ///
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.padding = Defaults.padding,
  });

  ///
  final void Function()? onPressed;

  ///
  final Widget child;

  ///
  final double? width;

  ///
  final double? height;

  ///
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Defaults.colors.accentLight,
            Defaults.colors.accentDark,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: Defaults.borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: padding,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: Defaults.borderRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}
