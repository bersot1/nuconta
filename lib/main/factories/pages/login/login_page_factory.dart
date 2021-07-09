import 'package:flutter/material.dart';

import '../../../../ui/ui.dart';

import '../../../../main/factories/pages/pages.dart';

Widget makeLoginPage() {
  return LoginPage(preseneter: makeGetxLoginPresenter());
}
