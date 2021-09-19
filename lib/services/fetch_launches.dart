import 'dart:convert';

import 'package:app_lanzamientos/models/launches.dart';
import 'package:http/http.dart' as http;

class LaunchesService {
  Future<List<Launch>> fetchLaunches() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

    if (response.statusCode == 200) {
      List<Launch> getLaunches(String str) =>
          List<Launch>.from(json.decode(str).map((x) => Launch.fromJson(x)));

      final launches = getLaunches(response.body);
      return launches;
    } else {
      throw Exception('Failed to load launches');
    }
  }
}
