import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/utils/database_helper.dart';
import 'package:local_db_test/models/section.dart'; // Import your models

class SectionController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var sections = <Section>[].obs;

  @override
  void onInit() {
    fetchSections();
    super.onInit();
  }

  void fetchSections() async {
    try {
      var fetchedSections =
          await dbHelper.getSections(); // Implement getSections() in DBHelper
      sections.assignAll(fetchedSections);
    } catch (e) {
      log('Error fetching hadiths: $e');
      Get.snackbar('Error fetching hadiths: ', "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10));
    }
  }
}
