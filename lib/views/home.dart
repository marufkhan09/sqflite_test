import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/controllers/bookController.dart';
import 'package:local_db_test/controllers/chapterController.dart';
import 'package:local_db_test/controllers/hadithController.dart';
import 'package:local_db_test/controllers/sectionController.dart';
import 'package:local_db_test/models/hadith.dart';
import 'package:local_db_test/models/section.dart';

class HomeScreen extends StatelessWidget {
  final BooksController bookController = Get.put(BooksController());
  final SectionController sectionController = Get.put(SectionController());
  final HadithController hadithController = Get.put(HadithController());
  final ChapterController chapterController = Get.put(ChapterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF46B891),
        title: Obx(() {
          if (bookController.books.isEmpty) {
            return const SizedBox.shrink(); // Placeholder text while loading
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookController.books.first.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  chapterController.chapters.first.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontStyle: FontStyle.normal),
                ),
              ],
            );
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sectionController.sections.length,
                  itemBuilder: (context, index) {
                    Section section = sectionController.sections[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${section.number} ',
                                  style: const TextStyle(
                                      color: Color(0xFF46B891),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    if (section.number != section.title)
                                      TextSpan(
                                        text: section.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700,
                                            fontSize: 28),
                                      ),
                                  ],
                                ),
                              ),
                              if (section.preface != "" &&
                                  section.preface != null)
                                Divider(
                                  height: 32,
                                  color: Colors.grey.shade200,
                                ),
                              if (section.preface != null &&
                                  section.preface != "")
                                Text(
                                  '${section.preface}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade500,
                                      fontSize: 20),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Obx(() => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: hadithController.hadiths.length,
                                itemBuilder: (context, index) {
                                  Hadith hadith =
                                      hadithController.hadiths[index];
                                  if (hadith.sectionId == section.id) {
                                    return ListTile(
                                      title: Text(
                                        hadith.ar,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            fontSize: 20, height: 2),
                                      ),
                                      subtitle: Text(
                                        hadith.narrator,
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                          height: 2,
                                          fontSize: 20,
                                          color: Color(0xFF46B891),
                                        ),
                                      ),
                                      // Display other fields as needed
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              )),
                        ),
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
