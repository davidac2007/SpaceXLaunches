import 'package:flutter/material.dart';

class SpaceXLogo extends StatelessWidget {
  const SpaceXLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Image.network(
      // Sorry, I had to change the URL since the other one wasn't working fine.
      "https://www.pngfind.com/pngs/b/687-6876191_spacex-png.png",
      errorBuilder: (context, object, stackTrace) {
        return Container();
      },
    ));
  }
}
