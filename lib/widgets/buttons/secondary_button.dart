import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
  });

  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(8);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
      ),
      child: Ink(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Defaults.colors.accentLight,
              Defaults.colors.accentDark,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: radius,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: radius / 2,
              color: Defaults.colors.background,
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  Defaults.colors.accent,
                  Defaults.colors.accentDark,
                ],
              ).createShader(bounds),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
