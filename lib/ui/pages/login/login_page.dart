import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/components/components.dart';
import '../../../ui/mixins/mixins.dart';
import '../../ui.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  final ILoginPresenter preseneter;

  LoginPage({required this.preseneter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with NavigationManager, LoadingManager {
  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
          handleNavigation(widget.preseneter.navigateToStream, clear: true);
          handleLoading(context, widget.preseneter.isLoadingStream);

          widget.preseneter.mainErrorStream?.listen((error) {
            showErrorMessage(context, error!);
          });

          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.height(200),
                    ),
                    FlutterLogo(
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
                    Spacer(),
                    Text(
                      "from L.B",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "to NuBank",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
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
