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
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
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
                          child: Text(
                            launchesList[index].name.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                  );
                },
              ));
  }
}
