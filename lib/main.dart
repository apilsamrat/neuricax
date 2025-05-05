import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neuricax/core/constants/color_constants.dart';
import 'package:neuricax/core/themes/app_theme.dart';
import 'package:neuricax/firebase_options.dart';
import 'package:neuricax/router/routes.dart';

late final FirebaseAuth auth;
late final FirebaseApp app;

late bool isFirstTime;

final isDebugMode = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instance;
  runApp(MainApp());
  isFirstTime = true; //Random().nextBool();
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.white
    ..progressColor = Colors.white
    ..backgroundColor = primaryColor
    ..indicatorColor = Colors.white
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..dismissOnTap = true;
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Change to your desired color
        statusBarIconBrightness: Brightness.light, // Adjust icon brightness
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Sizzle - Where heart ignites',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        builder: EasyLoading.init(),
        themeMode: ThemeMode.light,
        initialRoute: '/onboarding',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
