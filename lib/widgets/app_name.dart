import 'package:flutter/material.dart';
import 'package:neuricax/core/constants/color_constants.dart';

Widget appNameWidget({double? size, Color? color, String? text}) {
  return Text(
    text ?? 'NeuricaX',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: "ecfo_brookshire",
      fontSize: size ?? 60,
      fontWeight: FontWeight.bold,
      color: color ?? primaryColor,
    ),
  );
}
