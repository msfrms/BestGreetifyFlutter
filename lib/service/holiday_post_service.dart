
import 'dart:convert';

import 'package:best_greetify/api/http_client.dart';
import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/service/post_service.dart';

class HolidayService implements PostService<List<Holiday>> {

  @override
  Future<List<Holiday>> fetchPosts() async {
    final response = await HttpClient().postWeb("https://api.wizl.me/v2/user/events/calendar?offset=0&only%5B%5D=holidays&size=300");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"].map<Holiday>((e) => Holiday.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class PostHolidayService implements PostService<List<PostHoliday>> {

  final int postId;

  PostHolidayService({required this.postId});

  @override
  Future<List<PostHoliday>> fetchPosts() async {
    final response = await HttpClient().get("https://api.wizl.me/v2/holiday/$postId/gift/sources");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"]["holiday_post_card"].map<PostHoliday>((e) => PostHoliday.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}