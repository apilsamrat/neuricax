// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// class ConnectionStatus extends StatefulWidget {
//   const ConnectionStatus({super.key});

//   @override
//   State<ConnectionStatus> createState() => _ConnectionStatusState();
// }

// class _ConnectionStatusState extends State<ConnectionStatus> {
//   late StreamSubscription<InternetStatus> listener;
//   bool hasConnection = true;
//   @override
//   initState() {
//     super.initState();
//     checkConnection();
//   }

//   void checkConnection() async {
//     listener =
//         InternetConnection().onStatusChange.listen((InternetStatus status) {
//       switch (status) {
//         case InternetStatus.connected:
//           setState(() {
//             hasConnection = true;
//           });
//           break;
//         case InternetStatus.disconnected:
//           setState(() {
//             hasConnection = false;
//           });
//           break;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     listener.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint(hasConnection ? "Has Internet" : "No Internet");
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.bounceIn,
//       height: hasConnection ? 25 : 25,
//       alignment: Alignment.center,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: hasConnection ? Colors.green : primaryColor,
//       ),
//       child: Text(
//         hasConnection ? "Connected" : "Please Check Your Internet Connection",
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
