import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../ui/components/components.dart';

import '../login_presenter.dart';

class CPFInput extends StatelessWidget {
  final MediaQueryTools mediaQuery;
  CPFInput({required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    final maskCpf = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    final presenter = Provider.of<ILoginPresenter>(context);
    return StreamBuilder<String?>(
      stream: presenter.cpfErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: "CPF",
            errorText: snapshot.data == "" ? null : snapshot.data,
          ),
          onChanged: presenter.validateCPF,
          keyboardType: TextInputType.number,
          cursorColor: Theme.of(context).primaryColor,
          inputFormatters: [maskCpf],
        );
      },
    );
  }
}
