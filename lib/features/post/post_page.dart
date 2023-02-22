import 'package:fetch_api/features/post/services.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String category;
  const PostPage({required this.category, super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostServices services = PostServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  void fetchPosts() {
    services.fetchPost(context: context, category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.category),
      ),
    );
  }
}
