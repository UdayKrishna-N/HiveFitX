import 'package:flutter/material.dart';

// gradients
LinearGradient blueLinear = LinearGradient(
  colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
LinearGradient logoLinear = LinearGradient(
  colors: [Color(0xFFCC8FED), Color(0xFF9DCEFF)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
LinearGradient purpleLinear = LinearGradient(
  colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

//basic colors
Color blueBasic = Color(0xFF92A3FD);
Color blackColor = Color(0xFF1D1617);
Color gray1 = Color(0xFF7B6F72);
Color gray2 = Color(0xFFADA4A5);
Color blueDot = Color(0xFF9DCEFF);
Color fieldColor = Color(0xFFF8F7F7);

// shadows
BoxShadow blueShadow = BoxShadow(blurRadius: 22,color: Color(0xFF95ADFE).withOpacity(0.3),);
BoxShadow purpleShadow = BoxShadow(blurRadius: 22,color: Color(0xFFC58BF2).withOpacity(0.3),);
BoxShadow fieldShadow = BoxShadow(blurRadius: 22,color: Color(0xFFF8F7F7).withOpacity(0.3),);

// textstyles
// style for HiveFit
TextStyle styleHiveFit = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 36,
  height: 1.5,
  color: blackColor,
);
// style for X
TextStyle styleX = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
  height: 1.5,
  foreground: Paint()..shader = blueLinear.createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
);
// style for headline
TextStyle headline = TextStyle(
  fontSize: 24,
  height: 1.5,
  fontWeight: FontWeight.w700,
  color: blackColor,
);
// style for subText
TextStyle subText = TextStyle(
  fontSize: 14,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: gray1,
);
