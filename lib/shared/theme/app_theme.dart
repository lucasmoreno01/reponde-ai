import 'package:flutter/material.dart';
import 'package:responde_ai/shared/theme/color_theme.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    // final textTheme = TextStyleConfig.getTextTheme(context);

    return ThemeData(
      useMaterial3: true,
      // textTheme: textTheme,
      // TODO COR DO BULLET E Chrckbox
      primaryColor: ColorTheme.primary,
      appBarTheme: const AppBarTheme(),
      filledButtonTheme:  FilledButtonThemeData(
        
        style: ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric( vertical: 16),
          ),
           backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                  return ColorTheme.neutral400;
                  }
                  return ColorTheme.secondary;
                },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                  return ColorTheme.neutral800;
                  }
                  return ColorTheme.neutral200;
                } 
                ),
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
         
          foregroundColor: WidgetStateProperty.all<Color>(
            ColorTheme.secondary,
          ),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorTheme.primary, width: 3.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorTheme.wrong, width: 3.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorTheme.wrong, width: 3.0),
        ),
        errorStyle: TextStyle(color: ColorTheme.wrong),
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
