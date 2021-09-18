import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/services/fetch_launches.dart';
import 'package:flutter/material.dart';

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
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black))
            : ListView.builder(
                itemCount: launchesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 300,
                    child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        color: Colors.black,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: Colors.white,
                                width: 50.0,
                                height: 50.0,
                                child: Image(
                                    image: NetworkImage(launchesList[index]
                                        .links!
                                        .patch!
                                        .small!)),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      launchesList[index].name.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      launchesList[index].dateLocal.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      launchesList[index].details.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      launchesList[index]
                                          .flightNumber
                                          .toString(),
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
