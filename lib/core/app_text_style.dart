import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/app_colors.dart';

class AppTextStyle {
  static TextStyle appDefaultSTextStyle = GoogleFonts.lato();

  static TextStyle titleTextStyle = appDefaultSTextStyle.copyWith(
      fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w800);

  static TextStyle descriptionTextStyle =
      AppTextStyle.appDefaultSTextStyle.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );


  static TextStyle sideHeadingTextStyle =
  AppTextStyle.appDefaultSTextStyle.copyWith(
  fontSize: 18.0,
  color: AppColors.buttonColor,
  fontWeight: FontWeight.bold,
  );

  static TextStyle buttonTextStyle = AppTextStyle.appDefaultSTextStyle
      .copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);
}
