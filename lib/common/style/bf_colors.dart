import 'package:flutter/material.dart';

class BFColors {
  static const String welcomeMessage = "Welcome to Flutter";

  static const int _primaryValue = 0xFF24292E;
  static const int _primaryLightValue = 0xFF42464b;
  static const int _primaryDarkValue = 0xFF121917;

  static const MaterialColor primarySwatch = const MaterialColor(_primaryValue, const <int, Color>{
    50: const Color(_primaryLightValue),
    100: const Color(_primaryLightValue),
    200: const Color(_primaryLightValue),
    300: const Color(_primaryLightValue),
    400: const Color(_primaryLightValue),
    500: const Color(_primaryValue),
    600: const Color(_primaryDarkValue),
    700: const Color(_primaryDarkValue),
    800: const Color(_primaryDarkValue),
    900: const Color(_primaryDarkValue),
  });
}

class BFConstant {}
