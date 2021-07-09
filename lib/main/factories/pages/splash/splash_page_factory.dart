import 'package:flutter/material.dart';
import '../../../../main/factories/pages/splash/splash_presenter_factory.dart';
import '../../../../ui/pages/pages.dart';

Widget makeSplashPage() {
  return SplashScreenPage(presenter: makeGetxSplashPresenter());
}
