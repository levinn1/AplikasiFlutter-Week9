import 'package:flutter/material.dart';
import 'login.dart'; // Login page
import 'home.dart'; // Marketplace page
import 'colors.dart'; // Your color constants

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login', // Start with the login page
      routes: {
        '/login': (context) => const LoginPage(),
        '/marketplace': (context) => const MarketplacePage(),
      },
      theme: _buildShrineTheme(),
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kTextColorWhite,
      secondary: kTextColorSecondary,
      error: kErrorColor,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kTextColorWhite,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kTextColorBlack,
      backgroundColor: kTextColorSecondary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: kTextColorBlack),
      ),
      floatingLabelStyle: TextStyle(color: kTextColorBlack),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: base.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
    titleLarge: base.titleLarge!.copyWith(fontSize: 18.0),
    bodySmall: base.bodySmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
    bodyLarge: base.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kTextColorBlack,
    bodyColor: kTextColorBlack,
  );
}
