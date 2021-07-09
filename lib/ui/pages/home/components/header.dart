import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/components/components.dart';
import '../../../../ui/ui.dart';

class Header extends StatelessWidget {
  final MediaQueryTools mediaQuery;
  final String nameUser;

  const Header({required this.mediaQuery, required this.nameUser});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IHomePresenter>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nameUser,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline2,
        ),

        CircleAvatar(
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              presenter.logout();
            },
            color: Colors.white,
          ),
        ),

        // Container(
        //   child: Row(
        //     children: [
        //       CircleAvatar(
        //         child: Icon(
        //           Icons.remove_red_eye_outlined,
        //           color: Colors.white,
        //         ),
        //       ),
        //       SizedBox(
        //         width: mediaQuery.width(5),
        //       ),
        //       CircleAvatar(
        //         child: Icon(
        //           Icons.brightness_5_outlined,
        //           color: Colors.white,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
