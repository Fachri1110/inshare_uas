import 'dart:io';

import 'package:flutter/material.dart';
import '/Models/stories.dart';

class StoriesItem extends StatelessWidget {
  final Stories stories;

  const StoriesItem({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: FileImage(
              File(stories.imageUrl)), // Gunakan FileImage untuk path lokal
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: 
            Text(
            stories.userName,
            style: const TextStyle(  // Menggunakan font Lexend Deca dari assets
              fontFamily: 'Lexend Deca',
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          ),
        ],
      ),
    );
  }
}
