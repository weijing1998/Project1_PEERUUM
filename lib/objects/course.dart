import 'package:pepelist/objects/group.dart';
import 'package:pepelist/objects/student.dart';

class Courses {
  String courseName;
  String courseID;
  String courseGroup;
  String courseBatch;
  List<Student> joinedStudent;
  List<Group> listOfGroup;

  Courses(String cn, String ci, String cg, String cb) {
    this.courseName = cn;
    this.courseID = ci;
    this.courseGroup = cg;
    this.courseBatch = cb;

    listOfGroup = [
      Group("Group 1", "1"),
      Group("Group 2", "2"),
      Group("Group 3", "3"),
      Group("Group 4", "4"),
    ];
  }
}

class Data {
  List<Courses> courses;
  

  Data() {
    courses = [
      Courses("WEB ENGINNERING", "STIW3045", "A", "A201"),
      Courses("SOFTWARE TESTING", "STIW3045", "A", "A201"),
      Courses("PUBLIC SPEAKING", "STIW3045", "A", "A201"),
      Courses("OPERATING SYSTEM", "STIW3045", "A", "A201"),
      Courses("SOFTWARE ENGINEERING", "STIW3045", "A", "A201")
    ];

  }
}
