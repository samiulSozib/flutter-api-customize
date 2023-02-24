import 'package:fetch_api/features/home2/controller.dart';
import 'package:fetch_api/features/home2/custom_post.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final Post2Controller _controller = Get.put(Post2Controller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomPost2(
                                  title: _controller.allPost[index].title,
                                  body: _controller.allPost[index].body),
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
