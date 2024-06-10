import 'package:flutter/material.dart';

int _greyPrimaryValue = 0xff1c2a3a;

MaterialColor primaryGrey = MaterialColor(
  _greyPrimaryValue, 
  <int,Color>{
    50: Color(0xfff9fafb),
    100:Color(0xfff3f4f6),
    200:Color(0xffe5e7eb),
    300:Color(0xffd1d5db),
    400:Color(0xff9ca3af),
    500:Color(0xff6b7280),
    600:Color(0xff4b5563),
    700:Color(0xff374151),
    800:Color(0xff1f2a37),
    900:Color(_greyPrimaryValue),
    //900:Color(0xff111928),
    },
  );

 