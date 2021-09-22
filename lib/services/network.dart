import 'dart:convert';

import 'package:http/http.dart';

import 'dart:async';

class Network {
  Network({required this.url});
  late String url;

  Future getAPIdata() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var networkData = jsonDecode(data);
      print(networkData);
      return networkData;
    } else {
      print(response.statusCode);
    }
  }
}
