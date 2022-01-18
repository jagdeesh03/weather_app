import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkNeeder {
  NetworkNeeder(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var weatherdata = jsonDecode(response.body);
      return weatherdata;
    } else {
      print(response.statusCode);
    }
  }
}
