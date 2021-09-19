import 'package:app_lanzamientos/models/launches.dart';
import 'package:flutter/material.dart';

class LaunchCard extends StatelessWidget {
  final Launch launch;
  const LaunchCard(this.launch, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            color: Colors.black,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(
                          launch.links?.patch?.small ?? "",
                          errorBuilder: (context, child, stackTrace) {
                            return const Center(
                                child: Flexible(
                              child: Text(
                                "NO HAY IMAGEN DISPONIBLE",
                                textAlign: TextAlign.center,
                              ),
                            ));
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 5.0,
                            ));
                          },
                        )),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
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
                            "Fecha de lanzamiento: ${launch.dateLocal?.day.toString()}/${launch.dateLocal?.month.toString()}/${launch.dateLocal?.year.toString()} ",
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                          separator(),
                          Text(
                            launch.details == null
                                ? "No hay detalles"
                                : "Detalles: ${launch.details!}",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                          separator(),
                          Text(
                            "Número de vuelo: ${launch.flightNumber.toString()}",
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }

  Widget separator() {
    return const SizedBox(height: 5.0);
  }
}
