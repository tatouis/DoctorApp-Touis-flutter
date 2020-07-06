import 'package:flutter/material.dart';

const mainBgColor = Color(0xFFF2F2F2);
const darkColor = Color(0xFF5095BF);
const midColor = Color(0xFF73BCD9);
const lightColor = Color(0xFF91D2D9);
const darkBlueColor = Color(0xFF329DF5);
const lightBlueColor = Color(0xFFA4E4FF);

const verdecolor = Color(0xFF3775F0);
const verdeFuerteColor = Color(0xFF0107F0);
const lightVerdeColor = Color(0xFFBCFF61);

const skyGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const verdeGradient = LinearGradient(
  colors: <Color>[verdeFuerteColor, verdecolor, lightVerdeColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const blueGradient = LinearGradient(
  colors: <Color>[lightBlueColor,darkBlueColor ],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

