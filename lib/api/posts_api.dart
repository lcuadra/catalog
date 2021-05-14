import 'dart:convert';

import 'package:calatolg/model/post.dart';
import 'package:http/http.dart' as http;

class PostsAPI {
  static const apiUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$apiUrl/users/1/posts'));

    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      final posts = <Post>[];

      for (final item in decode as List) {
        posts.add(Post.fromJson(item));
      }

      return posts;
    }

    return [];
  }
}
