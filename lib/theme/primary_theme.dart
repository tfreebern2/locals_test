import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF7A564A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBD0),
  onPrimaryContainer: Color(0xFF2E140C),
  secondary: Color(0xFF695C58),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFF1DFD9),
  onSecondaryContainer: Color(0xFF231917),
  tertiary: Color(0xFF645E4D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFEBE2CC),
  onTertiaryContainer: Color(0xFF1F1B0E),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1E1B1A),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1E1B1A),
  surfaceVariant: Color(0xFFEBE0DD),
  onSurfaceVariant: Color(0xFF4C4544),
  outline: Color(0xFF7D7573),
  shadow: Color(0xFF000000),
  inverseSurface: Color(0xFF33302F),
  onInverseSurface: Color(0xFFF7EFED),
  inversePrimary: Color(0xFFEBBCAD),
  surfaceTint: Color(0xFF7A564A),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFEBBCAD),
  onPrimary: Color(0xFF47291F),
  primaryContainer: Color(0xFF603F34),
  onPrimaryContainer: Color(0xFFFFDBD0),
  secondary: Color(0xFFD4C3BE),
  onSecondary: Color(0xFF392E2B),
  secondaryContainer: Color(0xFF504441),
  onSecondaryContainer: Color(0xFFF1DFD9),
  tertiary: Color(0xFFCEC6B1),
  onTertiary: Color(0xFF353022),
  tertiaryContainer: Color(0xFF4C4637),
  onTertiaryContainer: Color(0xFFEBE2CC),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFB4AB),
  background: Color(0xFF1E1B1A),
  onBackground: Color(0xFFE8E1DF),
  surface: Color(0xFF1E1B1A),
  onSurface: Color(0xFFE8E1DF),
  surfaceVariant: Color(0xFF4C4544),
  onSurfaceVariant: Color(0xFFCEC4C2),
  outline: Color(0xFF978F8D),
  shadow: Color(0xFF000000),
  inverseSurface: Color(0xFFE8E1DF),
  onInverseSurface: Color(0xFF33302F),
  inversePrimary: Color(0xFF7A564A),
  surfaceTint: Color(0xFFEBBCAD),
);


class PrimaryTheme {
  static ThemeData get primary {
    return ThemeData.from(
      colorScheme: darkColorScheme,
    );
  }
}
