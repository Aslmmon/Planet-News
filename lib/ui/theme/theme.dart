import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/providers.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  hintColor: Colors.grey,
  appBarTheme: const AppBarTheme(color: Colors.white),
  scaffoldBackgroundColor: Colors.white,
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
  primaryColor: Colors.white,
  hintColor: Colors.amber,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(fontSize: 20.0),
      titleMedium: GoogleFonts.poppins(fontSize: 16.0),
      titleSmall: GoogleFonts.poppins(fontSize: 14.0)),
  // ... other light theme properties
);

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider(this.pref) : super(lightTheme);
  final SharedPreferences? pref;

  void toggleTheme(bool isDarkTheme) {
    state = isDarkTheme ? applyDarkThem(true) : applyDarkThem(false);
  }

  ThemeData applyDarkThem(bool isDarkTheme) {
    pref?.setBool('isDarkTheme', isDarkTheme);
    return isDarkTheme ? darkTheme : lightTheme;
  }

  ThemeData getTheme() {
    final themeType = pref?.getBool('isDarkTheme');
    if (themeType == true) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>(
  (ref) => ThemeProvider(ref.read(sharedPrefProvider)),
);
