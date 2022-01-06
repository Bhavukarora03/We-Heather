import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  // final String url2;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    // http.Response response2 = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
