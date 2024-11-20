import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../screens/media_detail_screen.dart';

class MediaGrid extends StatelessWidget {
  final List<String> images = List.generate(
    60,
    (index) => 'https://picsum.photos/seed/$index/200/300',
  ); 
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MediaDetailScreen(
                  mediaUrl: images[index], 
                  caption: 'Caption for image $index',
                  userId: 'user_$index',
                  createdAt: DateTime.now(),
                  tag: 'Tag_$index',
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Image.network(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              if (index % 3 == 0)
                const Positioned(
                  top: 8,
                  right: 8,
                  child: PhosphorIcon(
                  PhosphorIconsFill.video, 
                  color: Colors.white,
                  size: 24,
                ),
                ),
            ],
          ),
        );
      },
    );
  }
}
