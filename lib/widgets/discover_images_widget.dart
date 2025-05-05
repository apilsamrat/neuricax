// import 'package:blaze/features/data/swipe_card_data/swipe_card_data_model.dart';
// import 'package:flutter/material.dart';

// class SwipeCardImagesWidget extends StatefulWidget {
//   final SwipeCardData cardData;
//   final int age;
//   final NetworkImage profileImage;
//   final NetworkImage? image;
//   final int numberPhotos;

//   const SwipeCardImagesWidget(
//       {super.key,
//       required this.cardData,
//       required this.age,
//       required this.profileImage,
//       this.image,
//       required this.numberPhotos});

//   @override
//   State<SwipeCardImagesWidget> createState() => SwipeCardImagesWidgetState();
// }

// class SwipeCardImagesWidgetState extends State<SwipeCardImagesWidget> {
//   int currentPhoto = 0;
//   NetworkImage? getImage() {
//     if (currentPhoto == 0) {
//       return widget.profileImage;
//     } else {
//       return widget.image;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.6,
//       child: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: (MediaQuery.of(context).size.height * 0.6),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: getImage() ?? widget.profileImage)),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     if (currentPhoto != 0) {
//                       setState(() {
//                         currentPhoto = currentPhoto - 1;
//                       });
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: (MediaQuery.of(context).size.height * 0.6) - 25,
//                     decoration: const BoxDecoration(color: Colors.transparent),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     if (currentPhoto != widget.numberPhotos - 1) {
//                       setState(() {
//                         currentPhoto = currentPhoto + 1;
//                       });
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: (MediaQuery.of(context).size.height * 0.6) - 25,
//                     decoration: const BoxDecoration(color: Colors.transparent),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 6.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width - 20,
//                 height: 6,
//                 child: ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: widget.numberPhotos,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, int i) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Container(
//                           width: ((MediaQuery.of(context).size.width -
//                                   (20 + ((widget.numberPhotos + 1) * 8))) /
//                               widget.numberPhotos),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border:
//                                   Border.all(color: Colors.white, width: 0.5),
//                               color: currentPhoto == i
//                                   ? Colors.white
//                                   : Theme.of(context)
//                                       .colorScheme
//                                       .secondary
//                                       .withValues(alpha:0.5)),
//                         ),
//                       );
//                     }),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
