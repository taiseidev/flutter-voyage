import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_voyage/features/tensorflow/image_classification_helper.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ImageClassificationSamplePage extends StatefulWidget {
  const ImageClassificationSamplePage({Key? key}) : super(key: key);

  @override
  ImageClassificationSamplePageState createState() =>
      ImageClassificationSamplePageState();
}

class ImageClassificationSamplePageState
    extends State<ImageClassificationSamplePage> {
  ImageClassificationHelper? imageClassificationHelper;
  Interpreter? interpreter;
  File? _image;
  String? _classificationResult;

  @override
  void initState() {
    super.initState();
    imageClassificationHelper = ImageClassificationHelper();
    imageClassificationHelper!.initHelper();
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final classification = await classifyImage(pickedImage.path);
      setState(() {
        _image = File(pickedImage.path);
        _classificationResult = classification;
      });
    }
  }

  Future<String> classifyImage(String imagePath) async {
    final imageData = File(imagePath).readAsBytesSync();
    final image = img.decodeImage(imageData);
    final classification =
        await imageClassificationHelper!.inferenceImage(image!);

    return classification.entries.first.key.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TFLite Flutter Demo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image != null
                  ? Image.file(_image!)
                  : const Text('No image selected'),
              const SizedBox(height: 16),
              _classificationResult != null
                  ? Text('Result: $_classificationResult')
                  : const Text('Classify an image to see the result'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick an Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
