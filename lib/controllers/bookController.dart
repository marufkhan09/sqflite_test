import 'package:get/get.dart';
import 'package:local_db_test/database_helper.dart';
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
    var fetchedBooks = await dbHelper.getBooks();
    books.assignAll(fetchedBooks);
  }
}
