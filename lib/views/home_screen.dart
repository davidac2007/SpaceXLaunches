import 'package:flutter/material.dart';

import 'widgets/spacex_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                    fontWeight: FontWeight.bold, color: Colors.lightBlue[900]),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
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
                  child: const Text(
                    "Card 1",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
