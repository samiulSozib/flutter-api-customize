import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/post2.dart';

class Post2Services {
  static Future<List<Post2>> fetchPost() async {
    const String url = 'https://dummyjson.com/posts';
    List<Post2> posts = [];

    try {
      http.Response res = await http.get(Uri.parse(url));
      // for (int i = 0; i < jsonDecode(res.body)['posts'].length; i++) {
      //   posts.add(
      //     Post2.fromJson(jsonDecode(res.body)['posts'][i]),
      //   );
      // }

      var objects = jsonDecode(res.body)['posts'] as List;
      posts = objects.map((postJson) => Post2.fromJson(postJson)).toList();

      print(jsonDecode(res.body)['posts']);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    return posts;
  }
}
