import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/category.dart';

class CustomCategory extends StatefulWidget {
  final Category cat;
  const CustomCategory({required this.cat, super.key});

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            child: Image.network(
              widget.cat.image,
              fit: BoxFit.fill,
              width: 200,
            ),
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              border: Border.all(
                width: 8,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.cat.name,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}
