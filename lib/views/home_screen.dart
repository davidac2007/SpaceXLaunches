import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/services/fetch_launches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'widgets/spacex_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LaunchesService client = LaunchesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 100.0, right: 80.0, bottom: 40.0),
            child: Column(
              children: [
                spaceXLogo(),
                Text(
                  "Lanzamientos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[900]),
                )
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: client.fetchLaunches(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Launch>> snapshot) {
              if (snapshot.hasData) {
                List<Launch>? launchesList = snapshot.data;

                return ListView.builder(
                    itemCount: launchesList?.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(10.0),
                          // height: 300,
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
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          width: 100.0,
                                          height: 100.0,
                                          child: Image.network(
                                            launchesList?[index]
                                                    .links
                                                    ?.patch
                                                    ?.small ??
                                                "",
                                            errorBuilder:
                                                (context, child, stackTrace) {
                                              return const Center(
                                                  child: Flexible(
                                                child: Text(
                                                  "NO HAY IMAGEN DISPONIBLE",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ));
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              launchesList![index].name!,
                                              style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Fecha de lanzamiento: ${launchesList[index].dateLocal?.day.toString()}/${launchesList[index].dateLocal?.month.toString()}/${launchesList[index].dateLocal?.year.toString()} ",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              launchesList[index].details ==
                                                      null
                                                  ? "No hay detalles"
                                                  : launchesList[index]
                                                      .details!,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Número de vuelo: ${launchesList[index].flightNumber.toString()}",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))));
                    });
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 8.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Cargando lanzamientos...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    )
                  ],
                ),
              );
            }
            // },
            ));
  }
}
