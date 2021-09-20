import 'package:flutter/material.dart';

class ErrorNetworkImage extends StatelessWidget {
  const ErrorNetworkImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/network_error.jpg",
          fit: BoxFit.fill,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "Ups, parece que no hay conexión a Internet...\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 22.0),
                    children: <TextSpan>[]),
              ))
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Conéctate a Internet e inténtalo de nuevo.",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              ))
        ]),
      ],
    );
  }
}
