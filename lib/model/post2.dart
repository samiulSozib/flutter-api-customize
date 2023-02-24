// To parse this JSON data, do
//
//     final post2 = post2FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Post2 {
  Post2({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final int reactions;

  Post2 copyWith({
    int? id,
    String? title,
    String? body,
    int? userId,
    List<String>? tags,
    int? reactions,
  }) =>
      Post2(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        userId: userId ?? this.userId,
        tags: tags ?? this.tags,
        reactions: reactions ?? this.reactions,
      );

  factory Post2.fromRawJson(String str) => Post2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post2.fromJson(Map<String, dynamic> json) => Post2(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        reactions: json["reactions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reactions": reactions,
      };
}
