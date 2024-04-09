import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String title;
  String description;
  Timestamp createdDate;

  NotesModel(
      {required this.title,
      required this.description,
      required this.createdDate});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'created_date': createdDate
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
        title: map["title"],
        description: map["description"],
        createdDate: map['created_date']);
  }
}
