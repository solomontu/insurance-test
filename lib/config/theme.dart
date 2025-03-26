import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:uitest/data/models/themes.dart';

class AppColors {
  AppColors();

  ThemeModel defaultTheme = ThemeModel(
    white: const Color.fromRGBO(255, 255, 255, 1),
    offWhite: const Color.fromRGBO(250, 250, 255, 1),
    green: const Color.fromRGBO(59, 170, 144, 1),
    green2: const Color.fromRGBO(18, 183, 106, 1),
    black: const Color(0xFF111111),
    textBlack: const Color.fromRGBO(52, 64, 84, 1),
    textGray: const Color.fromRGBO(152, 162, 179, 1),
    subText: const Color.fromRGBO(95, 115, 140, 1),
    subText2: const Color.fromRGBO(144, 144, 144, 1),
    subText3: const Color.fromRGBO(102, 112, 133, 1),
    purple: const Color.fromRGBO(122, 90, 248, 1),
    purpleLight: const Color.fromRGBO(244, 243, 255, 1),
    fadedBlack: const Color.fromRGBO(43, 43, 43, 0.5),
    fadedBlack2: const Color.fromRGBO(7, 7, 7, 1),
    borderBlack: const Color.fromRGBO(16, 24, 40, 1),
  );
}
