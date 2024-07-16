import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/utils/database_helper.dart';
import 'package:local_db_test/models/book.dart';

class BooksController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var books = <Book>[].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() async {
    try {
      var fetchedBooks = await dbHelper.getBooks();
      books.assignAll(fetchedBooks);
    } catch (e) {
      log('Error fetching books: $e');
      Get.snackbar('Error fetching books: ', "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10));
    }
  }
}
