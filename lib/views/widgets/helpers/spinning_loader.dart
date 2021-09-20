import 'package:flutter/material.dart';

class SpinningLoader extends StatelessWidget {
  const SpinningLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          )
        ],
      ),
    );
  }
}
