import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/controllers/bookController.dart';
import 'package:local_db_test/controllers/chapterController.dart';
import 'package:local_db_test/controllers/hadithController.dart';
import 'package:local_db_test/controllers/sectionController.dart';
import 'package:local_db_test/models/hadith.dart';
import 'package:local_db_test/models/section.dart';
import 'package:local_db_test/widgets/hexagon.dart';
import 'package:local_db_test/widgets/showDialog.dart';

class HomeScreen extends StatelessWidget {
  final BooksController bookController = Get.put(BooksController());
  final SectionController sectionController = Get.put(SectionController());
  final HadithController hadithController = Get.put(HadithController());
  final ChapterController chapterController = Get.put(ChapterController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 80,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  // Handle back button press
                },
              ),
              centerTitle: false,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.multiple_stop_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                )
              ],
              backgroundColor: const Color(0xFF46B891),
              floating: true,
              snap: true,
              title: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (bookController.books.isNotEmpty)
                      Text(
                        bookController.books.first.title,
                        style: Theme.of(context).textTheme.bodyMedium!.merge(
                            const TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    const SizedBox(height: 4),
                    if (chapterController.chapters.isNotEmpty)
                      Text(
                        chapterController.chapters.first.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .merge(const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )),
                      ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF46B891),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 120),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => ListView.builder(
                      padding: EdgeInsets.zero,
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
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '${section.number} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .merge(const TextStyle(
                                            color: Color(0xFF46B891),
                                          )),
                                      children: <TextSpan>[
                                        if (section.number != section.title &&
                                            section.title != "")
                                          TextSpan(
                                            text: section.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade700,
                                                fontSize: 20),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .merge(TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade500,
                                          )),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 12, right: 12, top: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Obx(() => ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: hadithController.hadiths.length,
                                    itemBuilder: (context, index) {
                                      Hadith hadith =
                                          hadithController.hadiths[index];
                                      if (hadith.sectionId == section.id) {
                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Center(
                                                        child: ClipPath(
                                                          clipper:
                                                              HexagonClipper(), // Set the desired corner radius
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .green
                                                                  .shade600,
                                                            ),
                                                            width: 40,
                                                            height: 40,
                                                            child: const Center(
                                                              child: Text(
                                                                'B',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            bookController.books
                                                                .first.title,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .merge(TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600)),
                                                          ),
                                                          Text(
                                                              "হাদিস: ${loc.tr(hadith.sectionId.toString())}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .merge(
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            60,
                                                                            101,
                                                                            62)),
                                                                  )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          showAlertDialog(
                                                              context);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          alignment:
                                                              Alignment.center,
                                                          width: 80,
                                                          height: 36,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: const Color(
                                                                  0xFF46B891)),
                                                          child: Text(
                                                            hadith.grade!,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .merge(const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.more_vert,
                                                        color: Colors
                                                            .grey.shade700,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                hadith.ar,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: const TextStyle(
                                                    fontFamily: "KFGQ",
                                                    fontSize: 20,
                                                    height: 2),
                                              ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${hadith.narrator} থেকে বর্ণিত :",
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .merge(const TextStyle(
                                                      height: 2,
                                                      color: Color(0xFF46B891),
                                                    )),
                                              ),
                                              Text(
                                                hadith.bn,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .merge(const TextStyle(
                                                      height: 2,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ],
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
          )
        ],
      ),
    );
  }
}
