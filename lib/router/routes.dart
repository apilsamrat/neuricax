import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuricax/app.dart';
import 'package:neuricax/features/home/home_screen.dart';
import 'package:neuricax/features/onboarding/onboarding_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return CupertinoModalPopupRoute(builder: (_) => MyApp());
    case '/onboarding':
      return CupertinoPageRoute(builder: (_) => OnBoardingScreen());
    case '/login':
      return CupertinoModalPopupRoute(builder: (_) => MyApp(isLogin: true));

    case '/home':
      return CupertinoPageRoute(builder: (_) => HomeScreen());
    default:
      return CupertinoPageRoute(
        builder:
            (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
