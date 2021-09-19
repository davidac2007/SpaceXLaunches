import 'package:app_lanzamientos/models/launches.dart';
import 'package:flutter/material.dart';

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
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          separator(),
          Text(
            "Fecha de lanzamiento: ${launch.dateLocal?.day.toString()}/${launch.dateLocal?.month.toString()}/${launch.dateLocal?.year.toString()}",
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          separator(),
          Text(
            launch.details == null
                ? "No hay detalles"
                : "Detalles: ${launch.details!}.",
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          separator(),
          Text(
            "Número de vuelo: ${launch.flightNumber.toString()}",
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget separator() {
    return const SizedBox(height: 5.0);
  }
}
