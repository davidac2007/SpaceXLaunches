import 'dart:convert';

import 'package:app_lanzamientos/models/launches.dart';
import 'package:http/http.dart' as http;

Future<List<Launches>> fetchLaunches() async {
  final response =
      await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

  if (response.statusCode == 200) {
    print("hey");

    List<Launches> welcomeFromJson(String str) =>
        List<Launches>.from(json.decode(str).map((x) => Launches.fromJson(x)));

    final launches = welcomeFromJson(response.body);
    print(response.body);
    print(launches[0].name);
    return launches;
  } else {
    throw Exception('Failed to load launches');
  }
}
