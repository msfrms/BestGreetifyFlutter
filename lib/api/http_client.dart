import 'package:http/http.dart' as http;

class HttpClient {
  final authorization = "Basic bW9iaWxlY2xpZW50OkxXdzhudzRjdlNvN0tkQlNWZ0Fq";
  final userAgent = "Greetify eCards/1.0.2 (com.wizl.ecards; build:2; iOS 14.7.1) Alamofire/4.8.2";

  Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url), headers: {
      "Authorization": authorization,
      "User-Agent": userAgent,
      "Accept-Language": "ru-RU;q=1.0, en-RU;q=0.9"
    });
  }

  Future<http.Response> post(String url) async {
    return await http.post(Uri.parse(url), headers: {
      "Authorization": authorization,
      "User-Agent": userAgent,
      "Accept-Language": "ru-RU;q=1.0, en-RU;q=0.9"
    });
  }

  Future<http.Response> postWeb(String url) async {
    return await http.post(Uri.parse(url), headers: {
      "Authorization": authorization,
      "User-Agent": userAgent,
      "Accept-Language": "ru-RU;q=1.0, en-RU;q=0.9",
      "Content-Type": "application/x-www-form-urlencoded; charset=utf-8"
    }, body: "");
  }
}