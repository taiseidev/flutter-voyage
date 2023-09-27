import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ImagePicker _picker;
  File? file;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> pickImage(ImageSource source) async {
    // カメラから画像を取得
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        file = File(image.path);
        print(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            file != null ? Image.file(file!) : const Text("No Image..."),
            ElevatedButton(
              onPressed: () => pickImage(ImageSource.camera),
              child: const Text("カメラ"),
            ),
            ElevatedButton(
              onPressed: () => pickImage(ImageSource.gallery),
              child: const Text("ギャラリー"),
            ),
          ],
        ),
      ),
    );
  }
}
