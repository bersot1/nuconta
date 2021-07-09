import 'package:get/get_state_manager/get_state_manager.dart';

import '../../domain/usecases/usecases.dart';
import '../../presentation/mixins/mixins.dart';
import '../../ui/pages/splash_screen/splash_screen.dart';

class GetxScreenPagePresenter extends GetxController
    with NavigationManager
    implements ISplashScreenPresenter {
  final IGetCurrentCpf getCurrentCpf;

  GetxScreenPagePresenter({required this.getCurrentCpf});

  @override
  Future<void> loadCurrentUser() async {
    try {
      final currentCPF = await getCurrentCpf.get();
      if (currentCPF != null && currentCPF.isNotEmpty) {
        Future.delayed(const Duration(seconds: 5), () {
          navigateTo = '/home';
        });
      } else {
        Future.delayed(const Duration(seconds: 5), () => navigateTo = '/login');
      }
    } catch (e) {
      navigateTo = '/login';
    }
  }
}
