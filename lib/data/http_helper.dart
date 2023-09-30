import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=5626e706f919413e93d3dba81cc041ce
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '5626e706f919413e93d3dba81cc041ce';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
