import 'package:flutter/material.dart';

import '../../../../ui/components/components.dart';

class TitleOffer extends StatelessWidget {
  final MediaQueryTools mediaQuery;

  TitleOffer({required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.height(10)),
      child: Text(
        'Ofertas'.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
