import 'package:flutter/material.dart';

import '../../../../main/factories/pages/pages.dart';
import '../../../../ui/ui.dart';

Widget makeLoginPage() {
  return LoginPage(preseneter: makeGetxLoginPresenter());
}
