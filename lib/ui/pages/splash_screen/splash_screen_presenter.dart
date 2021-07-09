abstract class ISplashScreenPresenter {
  Future<void> loadCurrentUser();

  Stream<String?>? get navigateToStream;
}
