import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  TextStyle get titleLogin;
  TextStyle get textButton;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get textButton => GoogleFonts.inter(
        color: Color(0xFF666666),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get titleLogin => GoogleFonts.inter(
        color: Color(0xFFFFFFFF),
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );
}
