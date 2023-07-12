import 'dart:convert';

import 'package:corona_virus/models/Covid_Stats_Model.dart';
import 'package:corona_virus/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class FetchData {
  Future<CovidStatsModel> fetchWorldsStatsServices() async {
    try {
      final response = await http.get(Uri.parse(App_urls.worldstats));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return CovidStatsModel.fromJson(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
    return fetchWorldsStatsServices();
  }

  var data;
  Future<List<dynamic>> countriesStats() async {
    try {
      final response = await http.get(Uri.parse(App_urls.countriesList));
      data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
    return data;
  }
}
