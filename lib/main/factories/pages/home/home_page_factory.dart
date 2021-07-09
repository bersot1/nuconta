import 'package:flutter/material.dart';

import '../../../../main/factories/pages/home/home.dart';
import '../../../../ui/ui.dart';

Widget makeHomePageFactory() {
  return HomePage(presenter: makeHomePresenterFactory());
}
