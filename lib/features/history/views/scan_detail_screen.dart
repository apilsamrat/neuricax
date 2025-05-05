import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:neuricax/widgets/button_container.dart';
import 'package:path_provider/path_provider.dart';

class ScanDetailScreen extends StatelessWidget {
  final Map<String, dynamic> scan;

  const ScanDetailScreen({super.key, required this.scan});

  Future<void> _deleteImage(BuildContext context) async {
    try {
      final file = File(scan['imagePath']);
      if (await file.exists()) {
        await file.delete();
      }

      // Remove entry from JSON
      final appDir = await getApplicationDocumentsDirectory();
      final historyFile = File('${appDir.path}/scan_history.json');
      if (await historyFile.exists()) {
        final data = await historyFile.readAsString();
        final List<dynamic> history =
            data.isNotEmpty ? List.from(jsonDecode(data)) : [];
        history.removeWhere((entry) => entry['imagePath'] == scan['imagePath']);
        await historyFile.writeAsString(jsonEncode(history));
      }

      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Scan deleted')));
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error deleting scan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(scan['datetime']);
    final formattedDate =
        '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';

    return Scaffold(
      appBar: AppBar(title: const Text("Scan Details")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
        child: Column(
          children: [
            Hero(
              tag: scan['imagePath'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(scan['imagePath']),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              scan['disease'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(formattedDate, style: const TextStyle(color: Colors.grey)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonContainerWidget(
                onPressed: () => _deleteImage(context),
                text: "Delete",
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
