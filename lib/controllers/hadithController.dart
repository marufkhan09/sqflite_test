import 'package:get/get.dart';
import 'package:local_db_test/database_helper.dart';
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
    var fetchedHadiths = await dbHelper.getHadiths(); // Implement getHadiths() in DBHelper
    hadiths.assignAll(fetchedHadiths);
  }
}
