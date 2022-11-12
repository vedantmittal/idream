import 'dart:convert';

FirebaseModel firebaseModelFromJson(String str) =>
    FirebaseModel.fromJson(json.decode(str));

String firebaseModelToJson(FirebaseModel data) => json.encode(data.toJson());

class FirebaseModel {
  FirebaseModel({
    required this.subjects,
    required this.books,
    required this.projects,
  });

  final List<BookInfo> subjects;
  final List<BookInfo> books;
  final List<BookInfo> projects;

  factory FirebaseModel.fromJson(Map<String, dynamic> json) => FirebaseModel(
        subjects: List<BookInfo>.from(
            json["subjects"].map((x) => BookInfo.fromJson(x))),
        books:
            List<BookInfo>.from(json["books"].map((x) => BookInfo.fromJson(x))),
        projects: List<BookInfo>.from(
            json["projects"].map((x) => BookInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class BookInfo {
  BookInfo({
    required this.nameEng,
    required this.nameHin,
    required this.image,
  });

  final String nameEng;
  final String nameHin;
  final String image;

  factory BookInfo.fromJson(Map<String, dynamic> json) => BookInfo(
        nameEng: json["name_eng"],
        nameHin: json["name_hin"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name_eng": nameEng,
        "name_hin": nameHin,
        "image": image,
      };
}
