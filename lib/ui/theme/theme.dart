import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.amber,
  appBarTheme: AppBarTheme(color: Colors.white10.withOpacity(0.98)),
  scaffoldBackgroundColor: Colors.white10.withOpacity(0.98),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(fontSize: 20.0),
      titleMedium: GoogleFonts.poppins(fontSize: 16.0),
      titleSmall: GoogleFonts.poppins(fontSize: 14.0)),
  // ... other light theme properties
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey,
  hintColor: Colors.amber,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
      titleLarge:
          GoogleFonts.raleway(fontSize: 16.0, fontStyle: FontStyle.italic),
      titleMedium: GoogleFonts.raleway(fontSize: 16.0),
      titleSmall: GoogleFonts.raleway(fontSize: 14.0)),
  // ... other light theme properties
);

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(lightTheme);

  void toggleTheme() {
    state = state.brightness == Brightness.light ? lightTheme : darkTheme;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>(
  (ref) => ThemeProvider(),
);
