import 'package:evently_project/utilites/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppStyles{
  static TextStyle bold24White=GoogleFonts.inter(
      fontSize: 24,fontWeight: FontWeight.bold
      ,color: AppColors.white);

  static TextStyle bold16White=GoogleFonts.inter(
      fontSize: 16,fontWeight: FontWeight.w500
      ,color: AppColors.white);

  static TextStyle semi20White=GoogleFonts.inter(
      fontSize: 20,fontWeight: FontWeight.w500
      ,color: AppColors.white);

  static TextStyle semi16Black=GoogleFonts.inter(
      fontSize: 16,fontWeight: FontWeight.w500
      ,color: AppColors.black);
  static TextStyle bold14Black=GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.bold
      ,color: AppColors.black);
  static TextStyle semi14Black=GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.w500
      ,color: AppColors.black);

  static TextStyle semi16Gray=GoogleFonts.inter(
      fontSize: 16,fontWeight: FontWeight.w500
      ,color: AppColors.gray);

  static TextStyle bold14primaryLight=GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.bold
      ,color: AppColors.primaryLight);

  static TextStyle bold20primaryLight=GoogleFonts.inter(
      fontSize: 20,fontWeight: FontWeight.bold
      ,color: AppColors.primaryLight);

  static TextStyle semi20primaryLight=GoogleFonts.inter(
      fontSize: 20,fontWeight: FontWeight.w500
      ,color: AppColors.primaryLight);

  static TextStyle boldItalic16primaryLight=GoogleFonts.inter(
      fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
      ,color: AppColors.primaryLight);

}