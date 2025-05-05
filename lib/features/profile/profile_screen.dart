import 'package:flutter/material.dart';
import 'package:neuricax/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  auth.currentUser!.photoURL
                      .toString(), // Replace with real image URL
                ),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                auth.currentUser!.displayName!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle / Role
              const Text(
                "NeuricaX User",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // Card Info
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.email,
                        label: auth.currentUser!.email!,
                      ),
                      SizedBox(height: 16),
                      InfoRow(icon: Icons.phone, label: "+977 9821904508"),
                      SizedBox(height: 16),
                      InfoRow(icon: Icons.location_on, label: "Kathmandu"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoRow({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
