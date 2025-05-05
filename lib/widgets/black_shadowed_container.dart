import 'package:flutter/material.dart';

class BlackShadowedContainer extends StatelessWidget {
  final Widget? child;
  final bool isRounded;
  // final double height, width;

  const BlackShadowedContainer({
    super.key,
    required this.child,
    this.isRounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isRounded
          ? const BorderRadius.all(Radius.circular(20))
          : BorderRadius.zero,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 8, 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha:0),
              Colors.black.withValues(alpha:0.01),
              Colors.black.withValues(alpha:0.02),
              Colors.black.withValues(alpha:0.03),
              Colors.black.withValues(alpha:0.04),
              Colors.black.withValues(alpha:0.05),
              Colors.black.withValues(alpha:0.06),
              Colors.black.withValues(alpha:0.07),
              Colors.black.withValues(alpha:0.08),
              Colors.black.withValues(alpha:0.09),
              Colors.black.withValues(alpha:0.1),
              Colors.black.withValues(alpha:0.2),
              Colors.black.withValues(alpha:0.3),
              Colors.black.withValues(alpha:0.4),
              Colors.black.withValues(alpha:0.5),
              Colors.black.withValues(alpha:0.6),
              Colors.black.withValues(alpha:0.7),
              Colors.black.withValues(alpha:0.8),
              Colors.black.withValues(alpha:0.8),
              Colors.black.withValues(alpha:0.9),
              Colors.black.withValues(alpha:1),
            ],
            tileMode: TileMode.clamp,
            end: AlignmentDirectional.bottomCenter,
            begin: AlignmentDirectional.topCenter,
          ),
          borderRadius: isRounded
              ? const BorderRadius.all(Radius.circular(10))
              : BorderRadius.zero,
        ),
        child: child,
      ),
    );
  }
}
