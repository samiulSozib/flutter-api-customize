import 'dart:convert';

import 'package:fetch_api/features/home/services.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../post/post_page.dart';
import 'custom_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeServices services = HomeServices();
  List<Category>? cat;
  @override
  void initState() {
    // TODO: implement initState
    fetchCategory();
    super.initState();
  }

  fetchCategory() async {
    cat = await services.fetchCategory(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cat == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cat!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostPage(
                                  category: cat![index].name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomCategory(
                                cat: cat![index],
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
    );
  }
}
