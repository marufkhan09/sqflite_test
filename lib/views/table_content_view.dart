// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/database_controller.dart';

// class TableContentView extends StatelessWidget {
//   final String tableName;
//   final DatabaseController databaseController = Get.find();

//   TableContentView({super.key, required this.tableName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Table: $tableName'),
//       ),
//       body: Obx(() {
//         if (databaseController.tableContent.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         List<String> columns = databaseController.tableContent.first.keys.toList();
//         return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
//             rows: databaseController.tableContent.map((row) {
//               return DataRow(
//                 cells: columns.map((column) => DataCell(Text(row[column].toString()))).toList(),
//               );
//             }).toList(),
//           ),
//         );
//       }),
//     );
//   }
// }
