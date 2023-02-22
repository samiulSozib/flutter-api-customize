import 'package:fetch_api/features/post/controller.dart';
import 'package:fetch_api/features/post/custom_post.dart';
import 'package:fetch_api/features/post/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/post.dart';

class PostPage extends StatefulWidget {
  final String category;
  const PostPage({required this.category, super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostController _controller = Get.put(PostController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchCategoryPost(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Obx(
        () => _controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _controller.allPost.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PostPage(
                              //       category: posts![index].title,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomPost(
                                  title: _controller.allPost[index].title,
                                  description:
                                      _controller.allPost[index].description,
                                  image: _controller.allPost[index].images[0],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
