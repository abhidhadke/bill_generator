
import 'package:flutter/material.dart';

Future<DateTime?> datePickerDialog(BuildContext context){
  return showDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now().subtract(const Duration(days: 720)), lastDate: DateTime.now().add(const Duration(days: 720)), context: context);
}