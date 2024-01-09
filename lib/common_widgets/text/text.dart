import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Text homeTitle(String label) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: primaryColor,
        fontFamily: 'Rubik',
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.2),
  );
}

Text commonText(String label, {double? fontSize, Color? color}) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontFamily: 'Rubik',
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        height: 1.2),
  );
}
