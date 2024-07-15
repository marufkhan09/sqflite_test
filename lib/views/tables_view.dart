// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/database_controller.dart';
// import 'table_content_view.dart';

// class TablesView extends StatelessWidget {
//   final DatabaseController databaseController = Get.put(DatabaseController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Database Inspector'),
//       ),
//       body: Obx(() {
//         if (databaseController.tables.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return ListView.builder(
//           itemCount: databaseController.tables.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(databaseController.tables[index]),
//               onTap: () {
//                 databaseController.fetchTableContent(databaseController.tables[index]);
//                 Get.to(() => TableContentView(tableName: databaseController.tables[index]));
//               },
//             );
//           },
//         );
//       }),
//     );
//   }
// }
