import 'package:flutter/material.dart';

import 'package:calatolg/model/post.dart';
import 'package:calatolg/api/posts_api.dart';

class PostsBloc extends ChangeNotifier {
  PostsBloc({
    required PostsAPI api,
  }) : _api = api;

  final PostsAPI _api;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> getPosts() async {
    _isLoading = true;
    notifyListeners();

    _posts = await _api.getPosts();

    _isLoading = false;
    notifyListeners();
  }
}
