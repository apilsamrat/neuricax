import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neuricax/features/home/home_screen.dart';
import 'package:neuricax/main.dart';

import 'features/auth/views/login_screen.dart';

class MyApp extends ConsumerStatefulWidget {
  final bool isLogin;
  const MyApp({super.key, this.isLogin = false});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool isDebugMode = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
