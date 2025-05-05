import 'package:flutter/material.dart';
import 'package:neuricax/core/constants/color_constants.dart';
import 'package:neuricax/widgets/app_name.dart';
import 'package:neuricax/widgets/button_container.dart';
import 'package:neuricax/widgets/description_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: appNameWidget(
                      text: "Healing of Brain Starts",
                      size: 50,
                    ),
                  ),
                ),
                Expanded(flex: 1, child: appNameWidget()),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ButtonContainerWidget(
                    onPressed: () {
                      // auth.signOut();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    text: "Get Started",
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                descriptionText(
                  "Get accurate, real-time results to help guide your path to early diagnosis and treatment.",
                  size: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
