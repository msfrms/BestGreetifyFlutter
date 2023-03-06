import 'dart:convert';

import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/api/http_client.dart';

abstract class CategoryService {
  Future<List<Category>> fetchCategories();
}

class LifestyleCategoryService implements CategoryService {

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await HttpClient().get("https://api.wizl.me/v2/lifestyle/addressists");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["data"].map<Category>((e) => Category.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}

class BirthdayCategoryService implements CategoryService {

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await HttpClient().get("https://api.wizl.me/v2/user/friend/addresists");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);      
      return json["data"].map<Category>((e) => Category.fromJson(e)).toList();
    }
    else {
      throw Exception('Failed to load categories for response: ${response.body}');
    }
  }
}
