import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/controllers/bookController.dart';
import 'package:local_db_test/controllers/chapterController.dart';
import 'package:local_db_test/controllers/hadithController.dart';
import 'package:local_db_test/controllers/sectionController.dart';
import 'package:local_db_test/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hadith App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        // Define more routes if needed
      ],
      home: HomeScreen(), // Set initial screen
      // Injecting controllers globally
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BooksController());
        Get.lazyPut(() => SectionController());
        Get.lazyPut(() => HadithController());
        Get.lazyPut(() => ChapterController());
      }),
    );
  }
}
