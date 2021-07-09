import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/components/components.dart';
import '../../../../ui/ui.dart';

class CardBalance extends StatelessWidget {
  final MediaQueryTools mediaQuery;

  const CardBalance({required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IHomePresenter>(context);
    return Container(
      height: mediaQuery.height(100),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder<double?>(
            stream: presenter.ballanceStream,
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).primaryColorDark,
                        size: 35,
                      ),
                      SizedBox(
                        width: mediaQuery.width(15),
                      ),
                      const Text('Saldo na Conta'),
                    ],
                  ),
                  SizedBox(height: mediaQuery.height(20)),
                  Padding(
                    padding: EdgeInsets.only(left: mediaQuery.width(15)),
                    child: Text("R\$ ${snapshot.data ?? 0.0}"),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
