import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

mixin NavigationManager on GetxController {
  final _navigatorTo = RxnString();
  Stream<String?> get navigateToStream => _navigatorTo.stream;
  set navigateTo(String value) => _navigatorTo.subject.add(value);
}
