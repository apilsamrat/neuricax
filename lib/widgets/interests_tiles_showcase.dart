// import 'package:blaze/core/constants/color_constants.dart';
// import 'package:blaze/features/data/interests/interests.dart';
// import 'package:flutter/material.dart';

// Widget interestsTilesShowcase(
//     {required BuildContext context, required List<dynamic> selectedInterests}) {
//   interests.sort((a, b) => a.name.length.compareTo(b.name.length));
//   return Wrap(
//     children: interests.map((interest) {
//       if (selectedInterests.contains(interest.name)) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
//           child: Chip(
//             avatar: Icon(
//               interest.icon,
//               color: primaryColor,
//             ),
//             label: Text(interest.name),
//             padding: const EdgeInsets.all(10),
//           ),
//         );
//       } else {
//         return const SizedBox();
//       }
//     }).toList(),
//   );
// }
