import 'package:evently_project/utilities/app_colors.dart';
import 'package:evently_project/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor:AppColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
      ),
      floatingActionButtonTheme:
      FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(75),side: BorderSide(color: AppColors.white,width: 4)
          )
      ),
      // appBarTheme: AppBarTheme(
      //     backgroundColor: AppColors.primaryLight)
  );


  static final ThemeData darkTheme=
  ThemeData( primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor:AppColors.primaryDark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.primaryDark,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(75),side: BorderSide(color: AppColors.white,width: 4)
  )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
      ),
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryDark)
  );

}