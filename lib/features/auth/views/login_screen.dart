import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neuricax/core/constants/color_constants.dart';
import 'package:neuricax/core/riverpod/auth_riverpod.dart';
import 'package:neuricax/widgets/app_name.dart';
import 'package:neuricax/widgets/button_container.dart';
import 'package:neuricax/widgets/texts.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            appNameWidget(),
            Image.asset("assets/images/brain_image.png", height: 300),
            boldText("Please Sign in to Continue", size: 20),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ButtonContainerWidget(
                onPressed: () {
                  ref.read(appAuthProvider.notifier).signInWithGoogle();
                },
                text: "Sign in with Google",
                color: primaryColor,
                icon: Brand(Brands.google, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
