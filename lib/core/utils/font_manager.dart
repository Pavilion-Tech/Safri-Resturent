import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';

class AppFontWeight {
  static const String fontFamily = "Cairo";
}

class FontWeightManager {
  static const FontWeight extraLight = FontWeight.w100;

  static const FontWeight light = FontWeight.w200;

  static const FontWeight regular = FontWeight.w400;

  static const FontWeight medium = FontWeight.w500;

  static const FontWeight semiBold = FontWeight.w600;

  static const FontWeight bold = FontWeight.w700;

  static const FontWeight extraBold = FontWeight.w800;

  static const FontWeight black = FontWeight.w800;
}

class FontManager {
  static TextStyle getExtraLightStyle(
      {double fontSize = 14, Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.extraLight,color: color??ColorResources.black);
  }

  static TextStyle getLightStyle({double fontSize = 14,Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.light,color: color??ColorResources.black);
  }

  static TextStyle getRegularStyle(
      {double fontSize = 14, Color? color,double? height}) {
    return _getTextStyle(fontSize, FontWeightManager.regular,
        color:color??ColorResources.black,height: height);
  }

  static TextStyle getMediumStyle({
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color:color??ColorResources.black);
  }

  static TextStyle getSemiBold({double fontSize = 14, Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold,color: color??ColorResources.black);
  }

  static TextStyle getBoldStyle(
      {double fontSize = 14, Color? color,
      TextDecoration? textDecoration}) {
    return _getTextStyle(
        fontSize, FontWeightManager.bold, color:color??ColorResources.black,);
  }

  static TextStyle getExtraBoldStyle(
      {double fontSize = 14, Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.extraBold, color:color??ColorResources.black);
  }

  static TextStyle geBlackStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(fontSize, FontWeightManager.black,color:color??ColorResources.black);
  }

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, {Color? color,double? height}
      ) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: AppFontWeight.fontFamily,
        fontWeight: fontWeight,
        height: height,
        color: color??ColorResources.black);
  }
}
