import 'package:get/get.dart';
import 'package:local_db_test/database_helper.dart';
import 'package:local_db_test/models/section.dart';// Import your models

class SectionController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var sections = <Section>[].obs;

  @override
  void onInit() {
    fetchSections();
    super.onInit();
  }

  void fetchSections() async {
    var fetchedSections = await dbHelper.getSections(); // Implement getSections() in DBHelper
    sections.assignAll(fetchedSections);
  }
}
