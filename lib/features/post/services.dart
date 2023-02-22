import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/post.dart';

class PostServices {
  Future<List<Post>> fetchPost(
      {required BuildContext context, required String category}) async {
    const String url = 'https://api.escuelajs.co/api/v1/products';
    List<Post> posts = [];

    try {
      http.Response res = await http.get(Uri.parse(url));
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        var cat = jsonDecode(res.body)[i]['category'];
        if (jsonDecode(cat)['name'] == category) {
          posts.add(
            Post.fromJson(jsonEncode(res.body)[i] as Map<String, dynamic>),
          );
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
    print(posts);
    return posts;
  }
}
