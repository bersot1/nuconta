import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../ui/mixins/mixins.dart';

import '../../../ui/pages/pages.dart';

class SplashScreenPage extends StatefulWidget {
  final ISplashScreenPresenter presenter;

  const SplashScreenPage({required this.presenter});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with NavigationManager {
  @override
  void initState() {
    super.initState();
    widget.presenter.loadCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Builder(builder: (context) {
        handleNavigation(widget.presenter.navigateToStream);

        return Center(
            child: Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_w9ared8p.json'));
      }),
    );
  }
}
