import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/components/components.dart';
import '../login.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    required this.mediaQuery,
  });

  final MediaQueryTools mediaQuery;

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ILoginPresenter>(context);
    return StreamBuilder<bool?>(
      stream: presenter.isFormValidStream,
      builder: (context, snapshot) {
        return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.auth : null,
            child: Text('Entrar'));
      },
    );
  }
}
