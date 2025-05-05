import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:neuricax/features/history/views/scan_detail_screen.dart';
import 'package:neuricax/widgets/description_text.dart';
import 'package:path_provider/path_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  Future<List<Map<String, dynamic>>> _loadScanHistory() async {
    final dir = await getApplicationDocumentsDirectory();
    final historyFile = File('${dir.path}/scan_history.json');

    if (!await historyFile.exists()) return [];

    final content = await historyFile.readAsString();
    final List<dynamic> raw = jsonDecode(content);
    return raw.cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _loadScanHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final history = snapshot.data ?? [];

        if (history.isEmpty) {
          return Center(
            child: descriptionText('No scan history yet :):', size: 18),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final scan =
                history[history.length - 1 - index]; // Show latest first
            final date = DateTime.parse(scan['datetime']);
            final formattedDate =
                '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Hero(
                  tag: scan['imagePath'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(scan['imagePath']),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ScanDetailScreen(scan: scan),
                    ),
                  );
                },

                title: Text(
                  scan['disease'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(formattedDate),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            );
          },
        );
      },
    );
  }
}
