import 'package:flutter/material.dart';

Future<DateTime?> datePicker(
    {required BuildContext context,
    required DateTime selectedDate,
    required DateTime minDate,
    required DateTime maxDate}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: minDate,
    lastDate: maxDate,
  );

  return picked ?? selectedDate;
}
