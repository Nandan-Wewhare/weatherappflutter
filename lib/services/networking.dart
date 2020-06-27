import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{
  Networking(this.url);
  final String url;

  Future getdata() async{
    http.Response resp = await http.get(url);
    if (resp.statusCode == 200){
      return jsonDecode(resp.body);
    }
    else{
      print(resp.statusCode);
    }
  }
}
