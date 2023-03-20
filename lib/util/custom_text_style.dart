import 'package:diary_app/util/custom_color.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  //Header1
  static const h1BoldBlack = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static const h1BoldOlive = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: CustomColor.primaryOlive,
  );

  //Header2
  static const h2BoldBlack = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  //Body1
  static const b1BoldBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static const b1BoldWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.white,
  );

  static const b1RegularBlack = TextStyle(
    fontSize: 16,
    color: CustomColor.black,
  );

  static const b1RegularGrey = TextStyle(
    fontSize: 16,
    color: CustomColor.grey,
  );

  static const b1RegularOlive = TextStyle(
    fontSize: 16,
    color: CustomColor.primaryOlive,
  );

  //Body2
  static const b2RegularOlive = TextStyle(
    fontSize: 14,
    color: CustomColor.primaryOlive,
  );

  //Body3
  static const b3RegularGrey = TextStyle(
    fontSize: 12,
    color: CustomColor.grey,
  );
}
