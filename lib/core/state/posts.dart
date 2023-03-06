import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/core/action/post_action.dart';
import 'package:flutter/material.dart';

enum Status { inProgress, failed, success }

@immutable
class PostState {
  final Status status;
  final String error;
  final List<Post> posts;

  PostState({required this.status, required this.error, required this.posts});

  PostState copyWith({Status? status, String? error, List<Post>? posts}) {
    return PostState(
        status: status ?? this.status,
        error: error ?? this.error,
        posts: posts ?? this.posts);
  }

  static PostState initial() {
    return PostState(status: Status.inProgress, error: "", posts: List.empty());
  }
}

@immutable
class PostsState {
  final PostState popular;
  final PostState news;
  final Map<int, PostState> byCategoryId;
  final List<Category> categories;
  final Category selectedCategory;

  PostsState(
      {required this.popular,
      required this.news,
      required this.byCategoryId,
      required this.categories,
      required this.selectedCategory});

  PostsState copyWith(
      {PostState? popular,
      PostState? news,
      Map<int, PostState>? byCategoryId,
      List<Category>? categories,
      Category? selectedCategory}) {
    return PostsState(
        popular: popular ?? this.popular,
        news: news ?? this.news,
        byCategoryId: byCategoryId ?? this.byCategoryId,
        categories: categories ?? this.categories,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }

  static PostsState initial() {
    return PostsState(
        popular: PostState.initial(),
        news: PostState.initial(),
        byCategoryId: Map(),
        categories: List.empty(),
        selectedCategory: Category.popular());
  }

  int selectedIndex() {
    int selectedPage =
        categories.indexWhere((element) => element.id == selectedCategory.id);
    return selectedPage;
  }

  PostsState reduce({required dynamic action}) {
    if (action is SelectedCategoryBy) {
      return copyWith(selectedCategory: action.category);
    } else if (action is PostInProgressBy) {
      final postByCategoryId = byCategoryId;
      postByCategoryId[action.categoryId] =
          PostState(status: Status.inProgress, error: "", posts: List.empty());
      return copyWith(byCategoryId: postByCategoryId);
    } else if (action is PostFailedBy) {
      final postByCategoryId = byCategoryId;
      postByCategoryId[action.categoryId] = PostState(
          status: Status.failed, error: action.text, posts: List.empty());
      return copyWith(byCategoryId: postByCategoryId);
    } else if (action is PostSuccessBy) {
      byCategoryId[action.category.id] =
          PostState(status: Status.success, error: "", posts: action.posts);
      return copyWith(
          byCategoryId: byCategoryId, selectedCategory: action.category);
    } else if (action is UserPostInProgressBy) {
      switch (action.type) {
        case UserPostType.news:
          return copyWith(
              news: PostState(
                  status: Status.inProgress, error: "", posts: List.empty()));
        case UserPostType.popular:
          return copyWith(
              popular: PostState(
                  status: Status.inProgress, error: "", posts: List.empty()));
      }
    } else if (action is UserPostFailedBy) {
      switch (action.type) {
        case UserPostType.news:
          return copyWith(
              news: PostState(
                  status: Status.failed,
                  error: action.text,
                  posts: List.empty()));
        case UserPostType.popular:
          return copyWith(
              popular: PostState(
                  status: Status.failed,
                  error: action.text,
                  posts: List.empty()));
      }
    } else if (action is UserPostSuccessBy) {
      switch (action.type) {
        case UserPostType.news:
          return copyWith(
              news: PostState(
                  status: Status.success, error: "", posts: action.posts));
        case UserPostType.popular:
          return copyWith(
              popular: PostState(
                  status: Status.success, error: "", posts: action.posts));
      }
    } else if (action is ReceiveCategories) {
      final selectedCategory = Category.popular();
      final List<Category> categories = [Category.popular(), Category.news()];
      categories.addAll(action.categories);
      for (var category in categories) {
        byCategoryId[category.id] = PostState(
            status: Status.inProgress, error: "", posts: List.empty());
      }

      return copyWith(
          categories: categories,
          selectedCategory: selectedCategory,
          byCategoryId: byCategoryId);
    } else {
      return this;
    }
  }
}
