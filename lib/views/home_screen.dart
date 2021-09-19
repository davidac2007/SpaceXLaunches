import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/services/fetch_launches.dart';
import 'package:app_lanzamientos/views/widgets/card/launch_card.dart';
import 'package:app_lanzamientos/views/widgets/spinning_loader.dart';
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
  void dispose() {
    super.dispose();
    PaintingBinding.instance!.imageCache!.clear();
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
                      fontSize: 20.0,
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
                      return LaunchCard(launchesList![index]);
                    });
              }
              return const SpinningLoader();
            }));
  }
}
