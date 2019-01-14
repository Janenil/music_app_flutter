import 'package:http/http.dart' as http;

class HttpController {
  static void get(String url, Function callback, Map<String, String> params) async {
    // print('1111');
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      http.Response res = await http.get(url);
      if (callback != null) {
        callback(res.body);
      }
    }
    catch(exception) {
      print('错误: $exception');
    }
  }

  static void post (String url, Function callback, Map<String, dynamic> params, Function errorCallback) async {
    print(params.keys);

    try {
      http.Response res = await http.post(url, body:params);
      if (callback != null) {
        callback(res.body);
      }
    }
    catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}