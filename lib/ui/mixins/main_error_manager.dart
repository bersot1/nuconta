import 'package:flutter/material.dart';
import 'package:nuconta/ui/components/components.dart';

mixin ErrorManager {
  void handleErrorManager(BuildContext context, Stream<String?>? stream) {
    stream?.listen((error) {
      showErrorMessage(context, error!);
    });
  }
}
