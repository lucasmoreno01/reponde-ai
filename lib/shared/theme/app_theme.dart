import 'package:flutter/material.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {

    OutlineInputBorder buildDefaultInputBorder({required Color color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      );
    }

    return ThemeData(
      useMaterial3: true,
     
      primaryColor: ColorTheme.primary,
      appBarTheme: const AppBarTheme(),

      inputDecorationTheme: InputDecorationTheme(
        border: buildDefaultInputBorder(color: ColorTheme.neutral400),
        enabledBorder: buildDefaultInputBorder(color: ColorTheme.neutral400),
        errorBorder: buildDefaultInputBorder(color: ColorTheme.wrong),
        focusedBorder: buildDefaultInputBorder(color: ColorTheme.secondary),
        disabledBorder: buildDefaultInputBorder(color: ColorTheme.neutral300),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        errorStyle: TextStyle(fontSize: 12, color: ColorTheme.wrong),
        hintStyle: TextStyle(
          fontSize: 16,
          color: ColorTheme.neutral500,
          fontWeight: FontWeight.w400,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 16),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return ColorTheme.neutral400;
            }
            return ColorTheme.secondary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return ColorTheme.neutral800;
            }
            return ColorTheme.neutral200;
          }),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 16),
          ),

          foregroundColor: WidgetStateProperty.all<Color>(ColorTheme.secondary),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),

      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textColor: ColorTheme.neutral900,
        iconColor: ColorTheme.neutral900,
      ),
      buttonTheme: const ButtonThemeData(),
      iconTheme: const IconThemeData(),
      // scaffoldBackgroundColor: ColorTheme.primaryBackgorund,
    );
  }
}
