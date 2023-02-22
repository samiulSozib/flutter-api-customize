import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../model/category.dart';

class HomeServices {
  Future<List<Category>> fetchCategory({required BuildContext context}) async {
    const String url = 'https://api.escuelajs.co/api/v1/products';
    List<Category> categoryList = [];
    try {
      http.Response res = await http.get(Uri.parse(url));

      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        categoryList.add(
          Category.fromJson(jsonDecode(res.body)[i]['category']),
        );
      }
      //print(jsonDecode(res.body).length);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
    var seen = Set<String>();
    List<Category> uniquelist =
        categoryList.where((category) => seen.add(category.name)).toList();
    print(categoryList.length);
    return uniquelist;
  }
}
