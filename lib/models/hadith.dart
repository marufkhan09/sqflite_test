
/// Model for the 'hadith' table
class Hadith {
  final int hadithId;
  final int bookId;
  final String? bookName;
  final int chapterId;
  final int sectionId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String? note;
  final int? gradeId;
  final String? grade;
  final String? gradeColor;

  Hadith({
    required this.hadithId,
    required this.bookId,
    this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
  });

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      hadithId: map['hadith_id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      chapterId: map['chapter_id'],
      sectionId: map['section_id'],
      narrator: map['narrator'],
      bn: map['bn'],
      ar: map['ar'],
      arDiacless: map['ar_diacless'],
      note: map['note'],
      gradeId: map['grade_id'],
      grade: map['grade'],
      gradeColor: map['grade_color'],
    );
  }
}