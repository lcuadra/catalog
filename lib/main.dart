import 'package:calatolg/api/posts_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calatolg/bloc/post_bloc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostsBloc(api: PostsAPI()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Catalog(),
      ),
    );
  }
}

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<PostsBloc>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PostsBloc>();
    final posts = bloc.posts;

    return Scaffold(
      appBar: AppBar(),
      body: bloc.isLoading || posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (_, int i) {
                final post = posts[i];

                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
    );
  }
}
