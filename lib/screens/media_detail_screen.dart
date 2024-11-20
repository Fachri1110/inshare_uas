import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MediaDetailScreen extends StatelessWidget {
  final String mediaUrl;
  final String caption;
  final String userId;
  final DateTime createdAt;
  final String tag;

  const MediaDetailScreen({
    super.key,
    required this.mediaUrl,
    required this.caption,
    required this.userId,
    required this.createdAt,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsRegular.arrowLeft),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://example.com/user_avatar.jpg'), // Avatar user
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nadya Amanda',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Suggested for you',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Follow',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Image.network(
              mediaUrl,
              width: 360,
              height: 360,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '${createdAt.toLocal()}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                
                const Row(
                  children: [
                    PhosphorIcon(PhosphorIconsRegular.heart),
                    SizedBox(width: 8),
                    Text('1311'),
                    SizedBox(width: 24),
                    PhosphorIcon(PhosphorIconsRegular.chatCircle),
                    SizedBox(width: 8),
                    Text('5'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
