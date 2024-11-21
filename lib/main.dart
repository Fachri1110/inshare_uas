import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stories App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageUrl = image.path;
      });
    }
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageUrl = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          if (imageUrl != null)
            Positioned.fill(
              child: Image.file(
                File(imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          // Close Button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                setState(() {
                  imageUrl = null; // Menghapus gambar jika ditutup
                });
              },
            ),
          ),
          // Bottom-left Gallery Button
          Positioned(
            bottom: 30,
            left: 16,
            child: GestureDetector(
              onTap: _pickImageFromGallery,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: imageUrl != null
                      ? DecorationImage(
                          image: FileImage(File(imageUrl!)),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: imageUrl == null
                    ? const Icon(Icons.add_photo_alternate, color: Colors.white)
                    : null,
              ),
            ),
          ),
          // Circular Button at the Center for Camera
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _pickImageFromCamera, // Fungsi akses kamera
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Story',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
