import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.shadow,
    this.backgroundColor,
  });

  final Widget child;

  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final BoxShadow? shadow;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Defaults.margin,
      decoration: BoxDecoration(
        boxShadow: [shadow ?? Defaults.shadow],
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? Defaults.borderRadius,
          ),
        ),
        child: Container(
          height: height,
          padding: padding ?? Defaults.padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).cardColor,
            border: border ?? Defaults.border,
          ),
          child: child,
        ),
      ),
    );
  }
}
