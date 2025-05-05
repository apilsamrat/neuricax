// upload_image_screen.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuricax/core/riverpod/scan_riverpod.dart';
import 'package:neuricax/widgets/button_container.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class UploadImageScreen extends ConsumerStatefulWidget {
  const UploadImageScreen({super.key});

  @override
  ConsumerState<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends ConsumerState<UploadImageScreen> {
  Uint8List? _imageBytes;
  String? _fileName;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBytes = imageBytes;
          _fileName = pickedFile.name;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to pick image.')));
      }
    }
  }

  // Future<void> _scanImage() async {
  //   if (_imageBytes == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select an image first.')),
  //     );
  //     return;
  //   }

  //   ref.read(scanProvider).setIsLoading(true);
  //   ref.read(scanProvider).setStatusMessage("Processing image...");

  //   try {
  //     final tempDir = await getTemporaryDirectory();
  //     final file = await File(
  //       '${tempDir.path}/$_fileName',
  //     ).writeAsBytes(_imageBytes!);

  //     final predictionResult = await ref
  //         .read(scanProvider)
  //         .predictImage(file.path);

  //     if (predictionResult != null) {
  //       ref
  //           .read(scanProvider)
  //           .setStatusMessage("Prediction: $predictionResult");
  //     }

  //     await file.delete();
  //   } catch (e) {
  //     ref.read(scanProvider).setStatusMessage("Error during prediction: $e");
  //     if (kDebugMode) {
  //       print("Error during prediction: $e");
  //     }
  //   } finally {
  //     ref.read(scanProvider).setIsLoading(false);
  //   }
  // }
  Future<void> _scanImage() async {
    if (_imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first.')),
      );
      return;
    }

    ref.read(scanProvider).setIsLoading(true);
    ref.read(scanProvider).setStatusMessage("Processing image...");

    try {
      // 📁 Save image to app's documents directory
      final dir = await getApplicationDocumentsDirectory();
      final imagePath =
          '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_$_fileName';
      final imageFile = await File(imagePath).writeAsBytes(_imageBytes!);

      // 🔍 Predict
      final predictionResult = await ref
          .read(scanProvider)
          .predictImage(imageFile.path);

      if (predictionResult != null) {
        ref
            .read(scanProvider)
            .setStatusMessage("Prediction: $predictionResult");

        // 📝 Save history to JSON
        final historyFile = File('${dir.path}/scan_history.json');
        List<dynamic> history = [];

        if (await historyFile.exists()) {
          final content = await historyFile.readAsString();
          history = jsonDecode(content);
        }

        history.add({
          'imagePath': imagePath,
          'disease': predictionResult,
          'datetime': DateTime.now().toIso8601String(),
        });

        await historyFile.writeAsString(jsonEncode(history));
      }
    } catch (e) {
      ref.read(scanProvider).setStatusMessage("Error during prediction: $e");
      if (kDebugMode) {
        print("Error during prediction: $e");
      }
    } finally {
      ref.read(scanProvider).setIsLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final scanState = ref.watch(scanProvider);

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(245),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(60),
              blurRadius: 30,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_upload_rounded, size: 100, color: primaryColor),
            const SizedBox(height: 16),
            Text(
              _fileName ?? "Upload an MRI image to scan.",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text("Choose Image"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_imageBytes != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(
                  _imageBytes!,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonContainerWidget(
                isLoading: scanState.isLoading,
                onPressed: _scanImage,
                text: "Scan and Generate Report",
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              scanState.statusMessage,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
