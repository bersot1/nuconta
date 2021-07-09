import 'package:flutter/material.dart';
import 'package:nuconta/ui/components/components.dart';

mixin BuyManager {
  void handleBuyManager(BuildContext context, Stream<bool?>? stream) {
    stream?.listen((isSuccess) {
      if (isSuccess != null && isSuccess == false) {
        showErrorMessage(context, "Saldo insuficiente.");
      }
    });
  }
}
