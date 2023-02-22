import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/post.dart';

class PostServices {
  static Future<List<Post>> fetchPost({required String category}) async {
    const String url = 'https://api.escuelajs.co/api/v1/products';
    List<Post> posts = [];

    try {
      http.Response res = await http.get(Uri.parse(url));
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        var cat = Category.fromJson(jsonDecode(res.body)[i]['category']);
        if (cat.name == category) {
          posts.add(
            Post.fromJson(jsonDecode(res.body)[i]),
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    return posts;
  }
}
