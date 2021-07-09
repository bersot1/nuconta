import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/components/components.dart';
import '../../../ui/mixins/mixins.dart';
import '../../ui.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  final ILoginPresenter preseneter;

  const LoginPage({required this.preseneter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with NavigationManager, LoadingManager, KeyboardManager, ErrorManager {
  @override
  void dispose() {
    super.dispose();
    widget.preseneter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryTools mediaQuery = MediaQueryTools.of(context);
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleNavigation(widget.preseneter.navigateToStream);
          handleLoading(context, widget.preseneter.isLoadingStream);
          handleErrorManager(context, widget.preseneter.mainErrorStream);

          return GestureDetector(
            onTap: () => handleHideKeyboard(context),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.height(200),
                    ),
                    const FlutterLogo(
                      size: 80,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: mediaQuery.height(20)),
                      child: Center(
                        child: Text(
                          "Seja bem vindo",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                    Provider<ILoginPresenter>(
                      create: (context) => widget.preseneter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQuery.width(60)),
                        child: Form(child: CPFInput(mediaQuery: mediaQuery)),
                      ),
                    ),
                    Provider<ILoginPresenter>(
                      create: (context) => widget.preseneter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: mediaQuery.height(20)),
                        child: LoginButton(mediaQuery: mediaQuery),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "from L.B",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "to NuBank",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
