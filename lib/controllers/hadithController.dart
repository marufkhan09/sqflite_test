import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/utils/database_helper.dart';
import 'package:local_db_test/models/hadith.dart';

class HadithController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var hadiths = <Hadith>[].obs;

  @override
  void onInit() {
    fetchHadiths();
    super.onInit();
  }

  void fetchHadiths() async {
    try {
      var fetchedHadiths =
          await dbHelper.getHadiths(); // Implement getHadiths() in DBHelper
      hadiths.assignAll(fetchedHadiths);
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
