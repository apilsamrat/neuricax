import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonContainerWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final Color color;
  final bool? isLoading;
  final Color? foregroundColor;
  const ButtonContainerWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    this.icon,
    this.foregroundColor,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: !(isLoading ?? false) ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        foregroundColor: WidgetStatePropertyAll(
          foregroundColor ?? Colors.white,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      icon: icon ?? const SizedBox(),
      label:
          (isLoading ?? false)
              ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 4,
                strokeCap: StrokeCap.round,
              )
              : Text(
                text,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
    );
  }
}

class TextButtonContainerWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  const TextButtonContainerWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
            textStyle ??
            GoogleFonts.urbanist(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}
