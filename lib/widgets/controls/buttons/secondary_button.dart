import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.padding = Defaults.padding,
  });

  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: padding,
          side: BorderSide(width: 3, color: Defaults.colors.placeholder),
          shape: RoundedRectangleBorder(
            borderRadius: Defaults.borderRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}
