/// Model for the 'section' table
class Section {
  final int id;
  final int bookId;
  final String? bookName;
  final int chapterId;
  final int sectionId;
  final String title;
  final String? preface;
  final String? number;

  Section({
    required this.id,
    required this.bookId,
    this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
    this.preface,
    this.number,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      chapterId: map['chapter_id'],
      sectionId: map['section_id'],
      title: map['title'],
      preface: map['preface'],
      number: map['number'],
    );
  }
}
