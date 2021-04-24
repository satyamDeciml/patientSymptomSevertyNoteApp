import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zealth_symptomapp/models/symptommodel.dart';

Future<int> apiCall(SymptomModel data) async {
  final String url = "http://10.0.2.2:8000";
  var uri = Uri.parse(url);

  dynamic datatosendd = data.toJson();

  //final dynamic dataToSend = data;
  final response = await http.post(uri, body: datatosendd.toString());

  if (response.statusCode == 200) {
    print("success===>>");
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  } else
    return response.statusCode;
}

