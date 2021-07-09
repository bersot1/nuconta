import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../data/models/models.dart';

abstract class IHomePresenter {
  ValueNotifier<GraphQLClient> client();

  Stream<double?>? get ballanceStream;

  Stream<String?>? get mainErrorStream;
  Stream<String?>? get navigateToStream;

  Stream<bool?>? get isSuccessBuyStream;

  Future<void> buy(OfferModel offer);
  Future<void> saveBalance(double ballance);

  Future<void>? logout();
}
