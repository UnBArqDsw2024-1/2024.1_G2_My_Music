// Arquivo responsável por gerar responsividade as telas de acordo com o prototipo do figma
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;

  static late double figmaScreenWidth;
  static late double screenWidth;

  static late double figmaScreenHeight;
  static late double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    figmaScreenWidth = 360.0;

    screenHeight = _mediaQueryData.size.height;
    figmaScreenHeight = 812.0;
  }
}

double responsiveFigmaFontSize(double figmaFontSize) {
    return (figmaFontSize / SizeConfig.figmaScreenHeight) * SizeConfig.screenHeight;
}

double getWidthToHeightRatio() {
  return SizeConfig.screenWidth / SizeConfig.screenHeight;
}

double responsiveFigmaHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / SizeConfig.figmaScreenHeight) * screenHeight;
}

double responsiveFigmaWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / SizeConfig.figmaScreenWidth) * screenWidth;
}