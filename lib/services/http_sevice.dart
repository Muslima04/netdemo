import 'dart:convert';

import 'package:http/http.dart';
import 'package:netdemo/modal/post_model.dart';

class NetWork{
  static String BASE = "dummy.restapiexample.com";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "/api/v1/employee/1";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/public/api/v1/update/"; //{id}
  static String API_DELETE = "/public/api/v1/delete/2"; //{id}

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.http(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': post.name,
      'salary': post.salary,
      'age': post.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'name': post.name,
      'salary': post.salary,
      'age': post.age,
    });
    return params;
  }

}