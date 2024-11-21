import 'package:flutter/material.dart';
import '/Services/stories_services.dart';
import '/Models/stories.dart';
import '/Widget/stories_item.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final StoriesService storiesService = StoriesService();
  late Future<List<Stories>> futureStories;

  @override
  void initState() {
    super.initState();
    futureStories = storiesService.fetchStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stories')),
      body: FutureBuilder<List<Stories>>(
        future: futureStories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return StoriesItem(stories: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}