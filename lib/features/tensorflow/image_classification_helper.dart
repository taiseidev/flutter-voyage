/*
 * Copyright 2023 The TensorFlow Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *             http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'isolate_inference.dart';

class ImageClassificationHelper {
  static const modelPath = 'assets/model.tflite';
  static const labelsPath = 'assets/labels.txt';

  late final Interpreter interpreter;
  late final List<String> labels;
  late final IsolateInference isolateInference;
  late Tensor inputTensor;
  late Tensor outputTensor;

  Future<void> _loadModel() async {
    final options = InterpreterOptions();

    // モデルの推論速度向上
    if (Platform.isAndroid) {
      options.addDelegate(XNNPackDelegate());
    }

    if (Platform.isIOS) {
      options.addDelegate(GpuDelegate());
    }

    // Load model from assets
    interpreter = await Interpreter.fromAsset(modelPath, options: options);
    // Get tensor input shape [1, 224, 224, 3]
    inputTensor = interpreter.getInputTensors().first;
    // Get tensor output shape [1, 1001]
    outputTensor = interpreter.getOutputTensors().first;

    log('Interpreter loaded successfully');
  }

  // labels.txtから文字列を取得
  Future<void> _loadLabels() async {
    final labelTxt = await rootBundle.loadString(labelsPath);
    labels = labelTxt.split('\n');
  }

  Future<void> initHelper() async {
    _loadLabels();
    _loadModel();
    isolateInference = IsolateInference();
    await isolateInference.start();
  }

  Future<Map<String, double>> _inference(InferenceModel inferenceModel) async {
    final responsePort = ReceivePort();
    isolateInference.sendPort.send(
      inferenceModel..responsePort = responsePort.sendPort,
    );
    // get inference result.
    var results = await responsePort.first;
    return results;
  }

  // inference camera frame
  Future<Map<String, double>> inferenceCameraFrame(
      CameraImage cameraImage) async {
    var isolateModel = InferenceModel(cameraImage, null, interpreter.address,
        labels, inputTensor.shape, outputTensor.shape);
    return _inference(isolateModel);
  }

  // inference still image
  Future<Map<String, double>> inferenceImage(Image image) async {
    var isolateModel = InferenceModel(
      null,
      image,
      interpreter.address,
      labels,
      inputTensor.shape,
      outputTensor.shape,
    );
    return _inference(isolateModel);
  }

  Future<void> close() async {
    isolateInference.close();
  }
}
