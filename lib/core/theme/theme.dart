
import 'package:flutter/material.dart';

fontRegular(double fontSize, {Color? color}) => TextStyle(
  fontSize: fontSize,
  fontFamily: 'poppins',
  fontWeight: FontWeight.w400,
  color: color ?? Colors.black,
);

fontBlack(double fontSize, {Color? color}) => TextStyle(
  fontSize: fontSize,
  fontFamily: 'poppins',
  fontWeight: FontWeight.w900,
  color: color ?? Colors.black,
);

fontSemiBold(double fontSize, {Color? color}) => TextStyle(
  fontSize: fontSize,
  fontFamily: 'poppins',
  fontWeight: FontWeight.w600,
  color: color ?? Colors.black,
);