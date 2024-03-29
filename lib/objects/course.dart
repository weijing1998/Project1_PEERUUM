import 'package:flutter/cupertino.dart';

class Courses {
  String courseName;
  String courseID;
  String courseCode;
  String courseGroup;
  String courseBatch;
  List listOfGroup = [];
  List listOfForm = [];
  List listOfStudent = [];
  List listOfScore = [];
  String ownerid;

  Courses(
      {this.courseName,
      @required this.courseID,
      this.courseGroup,
      this.courseBatch,
      this.courseCode,
      this.listOfGroup,
      this.listOfForm,
      this.listOfStudent,
      this.listOfScore,
      @required this.ownerid});

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
        courseName: json["coursename"],
        courseID: json["courseid"],
        courseGroup: json["coursegroup"],
        courseBatch: json["coursebatch"],
        courseCode: json['coursecode'],
        listOfForm: json['listofform'],
        listOfGroup: json['listofgroup'],
        listOfStudent: json['listofstudent'],
        listOfScore: json['listofscore'],
        ownerid: json['ownerid']);
  }

  Map<String, dynamic> toJson() {
    return {
      "coursename": courseName,
      "courseid": courseID,
      "coursegroup": courseGroup,
      "coursebatch": courseBatch,
      "coursecode": courseCode,
      "listofform": listOfForm,
      "listofgroup": listOfGroup,
      'listofstudent': listOfStudent,
      'listofscore': listOfScore,
      'ownerid': ownerid
    };
  }
}
