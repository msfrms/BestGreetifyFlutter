
import 'package:best_greetify/api/models.dart';
import 'package:flutter/material.dart';

@immutable
class PostInProgressBy {
  final int categoryId;

  PostInProgressBy({required this.categoryId});
}

@immutable
class PostFailedBy {  
  final int categoryId;
  final String text;

  PostFailedBy({required this.categoryId, required this.text});
}

@immutable
class PostSuccessBy {  
  final Category category;
  final List<Post> posts;

  PostSuccessBy({required this.category, required this.posts});
}

enum UserPostType {
  news,
  popular
}

@immutable
class UserPostInProgressBy {
  final UserPostType type;

  UserPostInProgressBy({required this.type});
}

@immutable
class UserPostFailedBy {
  final UserPostType type;
  final String text;

  UserPostFailedBy({required this.text, required this.type});
}

@immutable
class UserPostSuccessBy {
  final UserPostType type;
  final List<Post> posts;

  UserPostSuccessBy({required this.posts, required this.type});
}

@immutable
class SelectedCategoryBy {
  final Category category;

  SelectedCategoryBy({required this.category});
}

@immutable
class ReceiveCategories {
  final List<Category> categories;

  ReceiveCategories({required this.categories});
}