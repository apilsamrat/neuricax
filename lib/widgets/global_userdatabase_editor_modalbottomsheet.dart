// import 'package:blaze/core/riverpod/appwrite/database_riverpod.dart';
// import 'package:blaze/widgets/auth_textformfield_containers.dart';
// import 'package:blaze/widgets/boxes.dart';
// import 'package:blaze/widgets/dialogs.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// Future updateDatabaseModalBottomSheet(
//     {required BuildContext context,
//     required WidgetRef ref,
//     required String title,
//     required String attributeKey,
//     required String label}) async {
//   TextEditingController controller = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey();
//   showAlertDialog(
//       context: context,
//       title: title,
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("Cancel")),
//         TextButton(
//             onPressed: () async {
//               if (formKey.currentState!.validate()) {
//                 EasyLoading.show();
//                 await ref
//                     .read(appwriteDatabaseProvider.notifier)
//                     .updateUserDocument(context: context, data: {
//                   "profession": controller.text.toString()
//                 }).then((value) {
//                   EasyLoading.dismiss();
//                   Navigator.pop(context);
//                 });
//               }
//             },
//             child: const Text("Update")),
//       ],
//       content: Form(
//         key: formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 20, right: 20),
//               child: TextFormFieldContainer(
//                 controller: controller,
//                 text: label,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please input a value";
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             boxVer(20),
//           ],
//         ),
//       ));
// }
