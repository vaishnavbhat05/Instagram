import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue), // Background color
        foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        ), // Padding
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ), // Text style
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        elevation: WidgetStateProperty.all(5), // Shadow elevation
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
    ),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    highlightColor: Colors.blueGrey,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black), // Background color
        foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        ), // Padding
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ), // Text style
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        elevation: WidgetStateProperty.all(5), // Shadow elevation
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
    ),
    textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black)),
    scaffoldBackgroundColor: Colors.white10,
    dividerTheme: const DividerThemeData(
      color: Colors.red
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black
    ),
    iconTheme: const IconThemeData(
      color: Colors.green,
  ),
  );
  static ThemeData redTheme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red), // Background color
        foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        ), // Padding
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ), // Text style
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
    ),
    brightness: Brightness.light,
  );

  static ThemeData greenTheme = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.green), // Background color
        foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        ), // Padding
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ), // Text style
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
    ),
    brightness: Brightness.light,
  );
}
