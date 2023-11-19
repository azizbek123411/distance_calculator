import 'dart:convert';

import 'package:distance_calculator/models/cordinates.dart';
import 'package:http/http.dart';

import '../models/result_model.dart';

class ApiService {
  static const String url = 'distance-calculator8.p.rapidapi.com';
  static const String path = "/calc";
  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '7966a7114amshef9c17b6438779dp1b1480jsne687c2abedb1',
    'X-RapidAPI-Host': 'distance-calculator8.p.rapidapi.com',
  };

  static Future<ResultModel?> calculate(Cordinates cordinates) async {
ResultModel? resultModel;
    Uri uri = Uri.https(url, path, cordinates.toMap());
    final response = await get(uri, headers: headers);
    if(response.statusCode == 200){
      final json=jsonDecode(response.body);
      resultModel = ResultModel.  fromMap(json);
    }
    return resultModel;
  }
}
