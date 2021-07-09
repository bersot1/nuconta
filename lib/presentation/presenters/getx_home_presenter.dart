import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/models/models.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../mixins/mixins.dart';
import '../../ui/ui.dart';

class GetxHomePresenter extends GetxController
    with NavigationManager
    implements IHomePresenter {
  final IHttpLink httpLink;

  final IGetCurrentBalance getCurrenteBalance;
  final ISaveCurrentBalance localSaveBalance;
  final IClearCurrentUser clearCurrentUser;

  var _mainError = RxnString();
  var _ballance = RxnDouble();
  var _isSuccessBuy = RxnBool();

  GetxHomePresenter({
    required this.httpLink,
    required this.getCurrenteBalance,
    required this.localSaveBalance,
    required this.clearCurrentUser,
  });

  ValueNotifier<GraphQLClient> client() {
    return ValueNotifier(
      GraphQLClient(
        link: httpLink.getLink(),
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      ),
    );
  }

  Stream<String?>? get mainErrorStream => _mainError.stream;
  Stream<double?>? get ballanceStream => _ballance.stream;
  Stream<bool?>? get isSuccessBuyStream => _isSuccessBuy.stream;

  Future<void> saveBalance(double ballance) async {
    try {
      await localSaveBalance.save(ballance);
      _ballance.value = ballance;
    } on DomainError catch (e) {
      _mainError.value = e.description;
    }
  }

  Future<void> buy(OfferModel offer) async {
    try {
      if (_ballance.value! > offer.price) {
        _ballance.value = _ballance.value! - offer.price.toDouble();
        _isSuccessBuy.value = true;
      } else {
        _isSuccessBuy.value = false;
        _isSuccessBuy.value = null;
        update();
      }
    } on DomainError catch (e) {
      _mainError.value = e.description;
    }
  }

  Future<void>? logout() async {
    await clearCurrentUser.clear();
    navigateTo = '/login';
  }
}
