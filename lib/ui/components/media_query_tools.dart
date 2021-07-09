import 'package:flutter/material.dart';

class MediaQueryTools {
  late BuildContext context;
  late DefaultValue defaultValues;
  late MediaQueryData _mediaQuery;

  MediaQueryTools.of(this.context) {
    defaultValues = DefaultValue(height: 640, width: 360);
    _mediaQuery = MediaQuery.of(context);
  }

  double heightPercent(double percent) {
    percent /= 100;
    return _mediaQuery.size.height * percent;
  }

  double widthPercent(double percent) {
    percent /= 100;
    return _mediaQuery.size.width * percent;
  }

  double textScale(double value, {double? max, double? min}) {
    return (_mediaQuery.textScaleFactor * value)
        .clamp(min ?? value, max ?? value);
  }

  double get aspectRatio => _mediaQuery.devicePixelRatio;

  double get getWidth => _mediaQuery.size.width;

  double get getHeight => _mediaQuery.size.height;

  double avaliableHeight(double appBarHeight) =>
      _mediaQuery.size.height - appBarHeight;

  double height(double height) {
    final double percent = ((height * 100) / defaultValues.height) / 100;
    return percent * _mediaQuery.size.height;
  }

  double width(double width) {
    final double percent = ((width * 100) / defaultValues.width) / 100;
    return percent * _mediaQuery.size.width;
  }
}

class DefaultValue {
  DefaultValue({
    required this.height,
    required this.width,
  });

  double height;
  double width;
}
