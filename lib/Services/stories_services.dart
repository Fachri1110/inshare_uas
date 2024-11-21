import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/stories.dart';

class StoriesService {
  Future<List<Stories>> fetchStories() async {
    final response = await http.get(Uri.parse('https://api.example.com/stories'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((stories) => Stories.fromJson(stories)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }
}