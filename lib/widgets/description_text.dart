import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget descriptionText(
  String text, {
  required double size,
  FontWeight? fontWeight,
  TextAlign? align,
}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.center,
    style: GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w500,
    ),
  );
}
