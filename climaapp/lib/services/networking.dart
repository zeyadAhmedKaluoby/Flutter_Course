import 'dart:convert';
import 'package:http/http.dart';
class NetworkHelper{
  final String url;
  NetworkHelper(this.url);
  Future getData() async
  {
    Response response=  await get(Uri.parse(url));
    String data =response.body;
    var decodedData = jsonDecode(data);
    return decodedData;

  }
}