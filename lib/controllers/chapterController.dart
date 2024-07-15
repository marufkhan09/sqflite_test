// controllers/chapter_controller.dart

import 'package:get/get.dart';
import 'package:local_db_test/database_helper.dart';
import 'package:local_db_test/models/chapter.dart';

class ChapterController extends GetxController {
  var chapters = <Chapter>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchChapters();
  }

  void fetchChapters() async {
    try {
      var dbHelper = DBHelper(); // Instantiate your DBHelper class
      var fetchedChapters = await dbHelper.getChapters(); // Implement getChapters() method in DBHelper
      chapters.assignAll(fetchedChapters);
        } catch (e) {
      print('Error fetching chapters: $e');
    }
  }
}
