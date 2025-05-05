import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/color_constants.dart';

Widget boldTextRed({required String text, required double size}) {
  return Text(
    text,
    style: GoogleFonts.urbanist(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}

Widget boldText(
  String s, {
  required double size,
  TextAlign? align,
  Color? color,
  double? height,
}) {
  return Text(
    s,
    textAlign: align,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color ?? primaryColor,
      textBaseline: TextBaseline.alphabetic,
      height: height,
    ),
  );
}

Widget errorText({
  required String text,
  double? size,
  TextAlign? align,
  Color? color,
}) {
  return Text(
    text,
    textAlign: align,
    style: GoogleFonts.poppins(color: color ?? primaryColor, fontSize: size),
  );
}
