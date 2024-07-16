// controllers/chapter_controller.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/utils/database_helper.dart';
import 'package:local_db_test/models/chapter.dart';

class ChapterController extends GetxController {
  var chapters = <Chapter>[].obs;
  final DBHelper dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchChapters();
  }

  void fetchChapters() async {
    try {
      var fetchedChapters = await dbHelper
          .getChapters(); // Implement getChapters() method in DBHelper
      chapters.assignAll(fetchedChapters);
    } catch (e) {
      log('Error fetching chapters: $e');
      Get.snackbar('Error fetching chapters: ', "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10));
    }
  }
}
