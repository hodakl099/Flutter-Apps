import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorkHelper {
  NetWorkHelper(this.url);
  final String url;

  final JsonDecoder _decoder = new JsonDecoder();

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> decodedData = _decoder.convert(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
