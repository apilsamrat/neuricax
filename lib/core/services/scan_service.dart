import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class ScanImage with ChangeNotifier {
  bool _isLoading = false;
  String _statusMessage = "";
  tfl.Interpreter? _interpreter;
  final List<String> _classLabels = [
    "Glioma",
    "Meningioma",
    "Notumor",
    "Pituitary",
  ];
  static const int _inputImageWidth = 240;
  static const int _inputImageHeight = 240;
  static const int _inputChannels = 3;
  static const int _outputClasses = 4;

  String get statusMessage => _statusMessage;
  bool get isLoading => _isLoading;
  List<String> get classLabels => _classLabels;

  ScanImage() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    final stopwatch = Stopwatch()..start();
    _isLoading = true;
    _statusMessage = "Loading model...";
    notifyListeners();
    try {
      _interpreter = await tfl.Interpreter.fromAsset(
        'assets/model/model.tflite',
      );
      stopwatch.stop(); // Stop the stopwatch
      final loadTime =
          stopwatch.elapsedMilliseconds; // Access elapsed time after stopping
      print('✅ TFLite model loaded in $loadTime ms');
      _statusMessage = "Model loaded.";
    } catch (e) {
      _statusMessage = "❌ Error loading model: $e";
      print('❌ Error loading model: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> predictImage(String imagePath) async {
    if (_interpreter == null) {
      _statusMessage = "⚠️ Model not loaded yet.";
      notifyListeners();
      return null;
    }
    _isLoading = true;
    _statusMessage = "Processing image...";
    notifyListeners();

    try {
      final File imageFile = File(imagePath);
      final img.Image? image = img.decodeImage(await imageFile.readAsBytes());

      if (image == null) {
        _statusMessage = "❌ Failed to decode image.";
        notifyListeners();
        return null;
      }

      // Resize the image
      final img.Image resizedImage = img.copyResize(
        image,
        width: _inputImageWidth,
        height: _inputImageHeight,
      );

      // Normalize and convert to Float32List
      final List<List<List<double>>> inputList = List.generate(
        _inputImageHeight,
        (y) => List.generate(_inputImageWidth, (x) {
          final img.Pixel pixel = resizedImage.getPixel(x, y);
          return [pixel.r / 255.0, pixel.g / 255.0, pixel.b / 255.0];
        }),
      );

      // Reshape the input
      final inputBytes =
          inputList.expand((row) => row.expand((pixel) => pixel)).toList();
      final inputData = Float32List.fromList(inputBytes).buffer
          .asFloat32List()
          .reshape([1, _inputImageHeight, _inputImageWidth, _inputChannels]);

      // Prepare output buffer
      var output = List.filled(
        _outputClasses,
        0.0,
      ).reshape([1, _outputClasses]);

      // Run inference
      _interpreter!.run(inputData, output);

      // Get the predicted class index
      final outputList = output[0] as List<double>;
      final predictedIndex = outputList.indexOf(
        outputList.reduce((a, b) => a > b ? a : b),
      );
      final predictedClass = _classLabels[predictedIndex];

      _statusMessage = "Prediction complete.";
      _isLoading = false;
      notifyListeners();
      return predictedClass;
    } catch (e) {
      _statusMessage = "❌ Error during inference: $e";
      print('❌ Error during inference: $e');
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setStatusMessage(String message) {
    _statusMessage = message;
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
    _statusMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
  }
}
