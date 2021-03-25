import 'package:flutter/cupertino.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';

class Courses {
  String courseName;
  String courseID;
  String courseCode;
  String courseGroup;
  String courseBatch;
  List<Group> listOfGroup=[];
  List<Forms> listOfForm=[];

  Courses(
      {this.courseName,
      @required this.courseID,
      this.courseGroup,
      this.courseBatch,
      this.courseCode,
      this.listOfGroup,
      this.listOfForm});

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      courseName: json["coursename"],
      courseID: json["courseid"],
      courseGroup: json["coursegroup"],
      courseBatch: json["coursebatch"],
      courseCode: json['coursecode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "coursename": courseName,
      "courseid": courseID,
      "coursegroup": courseGroup,
      "coursebatch": courseBatch,
      "coursecode": courseCode,
    };
  }
}
