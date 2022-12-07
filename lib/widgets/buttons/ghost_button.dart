import 'package:flutter/material.dart';
import 'package:valyou/data/defaults.dart';

class GhostButton extends StatelessWidget {
  const GhostButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.borderWidth = 3,
  });

  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    BorderRadius outerRadius = Defaults.borderRadius;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: outerRadius,
        ),
      ),
      child: Ink(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          color: Defaults.colors.detail,
          borderRadius: outerRadius,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Container(
            padding: EdgeInsets.all(Defaults.increment),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(outerRadius.bottomLeft.x - borderWidth),
              color: Defaults.colors.background,
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  Defaults.colors.detail,
                  Defaults.colors.detail,
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
