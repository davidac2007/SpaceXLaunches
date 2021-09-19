import 'package:app_lanzamientos/models/launches.dart';
import 'package:app_lanzamientos/views/widgets/card/launch_image.dart';
import 'package:app_lanzamientos/views/widgets/card/launch_info.dart';
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
                Radius.circular(20.0),
              ),
            ),
            color: Colors.black,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    LaunchImage(launch),
                    const SizedBox(
                      width: 20.0,
                    ),
                    LaunchInfo(launch)
                  ],
                ))));
  }
}
