import 'package:flutter/material.dart';
import 'package:news_route_app/utils/app_colors.dart';
import 'package:news_route_app/utils/app_styles.dart';
class AppThemes{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
      canvasColor: AppColors.black,
    indicatorColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
      tabBarTheme: TabBarThemeData(
          indicatorColor: AppColors.black
      ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.black
      ),
      centerTitle: true
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium24Black,
        headlineLarge: AppStyles.medium20Black,
        headlineSmall: AppStyles.bold24White

    )
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.black,
      canvasColor: AppColors.white,
      indicatorColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.black,
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.white
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(
              color: AppColors.white
          ),
          centerTitle: true
      ),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelSmall: AppStyles.medium12Grey,
          labelMedium: AppStyles.medium14White,
          headlineMedium: AppStyles.medium24White,
          headlineLarge: AppStyles.medium20White,
          headlineSmall: AppStyles.bold24Black
      )
  );
}