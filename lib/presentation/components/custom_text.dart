import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';

Widget customBlackText(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: ColorConstants.black),
  );
}

Widget customWhiteText(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: ColorConstants.white),
  );
}
