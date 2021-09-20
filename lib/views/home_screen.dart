import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/services/fetch_launches.dart';
import 'package:app_lanzamientos/views/widgets/card/launch_card.dart';
import 'package:app_lanzamientos/views/widgets/spinning_loader.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
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
              children: [spaceXLogo(), title()],
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder<Object>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data != ConnectivityResult.none ||
                  snapshot.data == ConnectivityResult.mobile ||
                  snapshot.data == ConnectivityResult.wifi) {
                return FutureBuilder(
                    future: client.fetchLaunches(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Launch>> snapshot) {
                      if (snapshot.hasData) {
                        List<Launch>? launchesList = snapshot.data;

                        return ListView.builder(
                            itemCount: launchesList?.length,
                            itemBuilder: (context, index) {
                              return LaunchCard(launchesList![index]);
                            });
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SpinningLoader();
                      } else {
                        return const Center(
                          child: Text("NO NET"),
                        );
                      }
                    });
              } else {
                return Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/images/network_error.jpg",
                      fit: BoxFit.fill,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text:
                                        "Ups, parece que no hay conexión a Internet...\n",
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
                                    text:
                                        "Conéctate a Internet e inténtalo de nuevo.",
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
            }));
  }

  Widget title() {
    return Text(
      "Lanzamientos",
      style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue[900]),
    );
  }
}
