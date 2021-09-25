import 'package:app_lanzamientos/models/launches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LaunchInfo extends StatelessWidget {
  const LaunchInfo(this.launch, {Key? key}) : super(key: key);
  final Launch launch;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            launch.name!,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
          separator(),
          styledText(
              "Fecha de lanzamientos:",
              " ${launch.dateLocal?.day.toString()}/${launch.dateLocal?.month.toString()}/${launch.dateLocal?.year.toString()}",
              TextAlign.start),
          separator(),
          styledText(
              "Detalles:\n",
              launch.details != null ? "${launch.details}" : "No hay detalles",
              TextAlign.justify),
          separator(),
          styledText("Número de vuelo: ", launch.flightNumber.toString(),
              TextAlign.start)
        ],
      ),
    );
  }

  Widget separator() {
    return const SizedBox(height: 7.0);
  }

  Widget styledText(String title, String body, TextAlign align) {
    return RichText(
      textAlign: align,
      text: TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.lightBlue[900],
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
          children: <TextSpan>[
            TextSpan(
              text: body,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
            )
          ]),
    );
  }
}
