// class ApiService {
//   static const String url = 'distance-calculator8.p.rapidapi.com';
//   static const String path = "/calc";
//   static const Map<String, String> headers = {
//     'X-RapidAPI-Key': '7966a7114amshef9c17b6438779dp1b1480jsne687c2abedb1',
//     'X-RapidAPI-Host': 'distance-calculator8.p.rapidapi.com',
//   };
//
//   static Future<ResultModel?> calculate(Cordinates cordinates) async {
// ResultModel? resultModel;
//     Uri uri = Uri.https(url, path, cordinates.toMap());
//     final response = await get(uri, headers: headers);
//     if(response.statusCode == 200){
//       final json=jsonDecode(response.body);
//       resultModel = ResultModel.  fromMap(json);
//     }
//     return resultModel;
//   }
// }
import 'dart:convert';
import 'dart:developer';

import 'package:distance_calculator/models/message_model.dart';
import 'package:http/http.dart';

class ApiService {
  static const String base = 'jsonplaceholder.typicode.com';
  static const String posts = '/posts';

  static String deletePost(int id) => '/posts/$deletePost';
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static Future<MessageModel?> postMessage(MessageModel messageModel) async {
    Uri uri = Uri.https(base, posts);
    final body = jsonEncode(messageModel.toMap());
    final response = await post(uri, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MessageModel.fromMap(
        jsonDecode(response.body),
      );
    } else {
      return null;
    }
  }

  static Future<List<MessageModel>> getAllMessages() async {
    List<MessageModel> messagesList = [];
    Uri uri = Uri.https(base, posts);
    final response = await get(uri);
    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body);
      for (final item in dataList) {
        try {
          messagesList.add(
            MessageModel.fromMap(item),
          );
        } catch (error, st) {
          log('Error:', error: error, stackTrace: st);
        }
      }
    }
    return messagesList;
  }

  static Future<bool> deleteMessage(int id) async {
    Uri uri = Uri.https(base, deletePost(id));
    final response = await delete(uri);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<MessageModel?> putMessage(MessageModel messageModel) async {
    Uri uri = Uri.https(base, posts);
    final body = jsonEncode(messageModel.toMap());
    final response = await put(uri, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MessageModel.fromMap(
        jsonDecode(response.body),
      );
    }
  }
}
