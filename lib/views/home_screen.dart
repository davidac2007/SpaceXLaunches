import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/services/fetch_launches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/spacex_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Launches> launchesList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getLaunches();
  }

  @override
  void dispose() {
    super.dispose();
    PaintingBinding.instance!.imageCache?.clear();
  }

  void getLaunches() {
    LaunchesService().fetchLaunches().then((launches) => {
          setState(() {
            launchesList = launches;
            isLoading = false;
          })
        });
  }

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
        body: isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(color: Colors.black),
                    SizedBox(height: 5.0),
                    Text("Loading launches")
                  ],
                ),
              )
            : ListView.builder(
                itemCount: launchesList.length,
                itemBuilder: (context, index) {
                  DateTime launchDate = launchesList[index].dateLocal!;
                  String launchDetails = launchesList[index].details.toString();

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
                                  width: 80.0,
                                  height: 80.0,
                                  child: Image.network(
                                    launchesList[index].links?.patch?.small ??
                                        "",
                                    errorBuilder: (context, child, stackTrace) {
                                      return const Center(
                                          child: Text(
                                        "NO HAY IMAGEN DISPONIBLE",
                                        textAlign: TextAlign.center,
                                      ));
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
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
                                      launchesList[index].name.toString(),
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Fecha de lanzamiento: ${launchDate.day.toString()}/${launchDate.month.toString()}/${launchDate.year.toString()} ",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      launchDetails == "null"
                                          ? "No hay detalles disponibles"
                                          : launchDetails,
                                      textAlign: TextAlign.justify,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Número de vuelo: ${launchesList[index].flightNumber.toString()}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ));
  }
}
