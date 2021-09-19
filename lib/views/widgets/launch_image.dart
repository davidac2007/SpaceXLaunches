import 'package:app_lanzamientos/models/launches.dart';
import 'package:flutter/material.dart';

class LaunchImage extends StatelessWidget {
  final Launch launch;
  const LaunchImage(this.launch, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
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
        ));
  }
}
