import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomText(
    String text, Color color, double size, FontWeight fontWeight) {
  return Text(
    text,
    style:
        GoogleFonts.eczar(fontSize: size, fontWeight: fontWeight, color: color),
  );
}
