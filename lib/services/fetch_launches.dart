import 'dart:convert';

import 'package:app_lanzamientos/models/launches.dart';
import 'package:http/http.dart' as http;

class LaunchesService {
  Future<List<Launches>> fetchLaunches() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

    if (response.statusCode == 200) {
      print("hey");

      List<Launches> getLaunches(String str) => List<Launches>.from(
          json.decode(str).map((x) => Launches.fromJson(x)));

      final launches = getLaunches(response.body);
      return launches;
    } else {
      throw Exception('Failed to load launches');
    }
  }
}
