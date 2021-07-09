abstract class ILoginPresenter {
  Future<void> auth();

  Stream<String?>? get cpfErrorStream;
  Stream<String?>? get mainErrorStream;
  Stream<String?>? get navigateToStream;

  Stream<bool?>? get isFormValidStream;
  Stream<bool?>? get isLoadingStream;

  void validateCPF(String cpf);

  void dispose();
}
