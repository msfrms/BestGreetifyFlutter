import 'dart:convert';

import 'package:best_greetify/api/http_client.dart';
import 'package:best_greetify/api/models.dart';

abstract class PostService<T> {
  Future<T> fetchPosts();
}

class LifestyleNewsPostService implements PostService<List<Post>> {

  final int page;

  LifestyleNewsPostService({required this.page});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/lifestyle/feed?order_by=new&page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class LifestylePopularPostService implements PostService<List<Post>> {

  final int page;

  LifestylePopularPostService({required this.page});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/lifestyle/feed?page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class LifestylePostService implements PostService<List<Post>> {

  final int page;
  final int categoryId;

  LifestylePostService({required this.page, required this.categoryId});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/lifestyle/feed?addressist_id=$categoryId&page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class BirthdayNewsPostService implements PostService<List<Post>> {

  final int page;

  BirthdayNewsPostService({required this.page});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/user/friend/gifts/sources?only=post_card&order_by=new&page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"][0]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class BirthdayPopularPostService implements PostService<List<Post>> {

  final int page;

  BirthdayPopularPostService({required this.page});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/user/friend/gifts/sources?only=post_card&page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"][0]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class BirthdayPostService implements PostService<List<Post>> {

  final int page;
  final int categoryId;

  BirthdayPostService({required this.page, required this.categoryId});

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient().get(
        "https://api.wizl.me/v2/user/friend/gifts/sources?addresist_id=$categoryId&only=post_card&page=$page"
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"][0]["post_card"].map<Post>((e) => Post.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}