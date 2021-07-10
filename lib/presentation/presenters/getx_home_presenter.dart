import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/models/models.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../presentation/mixins/mixins.dart';
import '../../ui/ui.dart';

class GetxHomePresenter extends GetxController
    with NavigationManager
    implements IHomePresenter {
  final IHttpLink httpLink;

  final IGetCurrentBalance getCurrenteBalance;
  final ISaveCurrentBalance localSaveBalance;
  final IClearCurrentUser clearCurrentUser;

  final _mainError = RxnString();
  final _ballance = RxnDouble();
  final _isSuccessBuy = RxnBool();

  GetxHomePresenter({
    required this.httpLink,
    required this.getCurrenteBalance,
    required this.localSaveBalance,
    required this.clearCurrentUser,
  });

  @override
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

  @override
  Stream<String?>? get mainErrorStream => _mainError.stream;
  @override
  Stream<double?>? get ballanceStream => _ballance.stream;
  @override
  Stream<bool?>? get isSuccessBuyStream => _isSuccessBuy.stream;

  @override
  Future<void> saveBalance(double ballance) async {
    try {
      await localSaveBalance.save(ballance);
      _ballance.value = ballance;
    } on DomainError catch (e) {
      _mainError.value = e.description;
    }
  }

  @override
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

  @override
  Future<void>? logout() async {
    await clearCurrentUser.clear();
    navigateTo = '/login';
  }
}
