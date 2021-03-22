import 'package:flutter/cupertino.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:uuid/uuid.dart';

class ProjectProvider with ChangeNotifier {
  final firestoreservice = Crudmethod();

  ///////////////////////(Courses)
  String _courseName;
  String _courseId;
  String _courseGroup;
  String _courseBatch;
  String _courseCode;
  var uuid = Uuid();
  ///////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// (Courses)
  //Getter
  String get courseName => _courseName;
  String get courseId => _courseId;
  String get courseGroup => _courseGroup;
  String get courseBatch => _courseBatch;
  String get courseCode => _courseCode;
  Stream<List<Courses>> get courselist => firestoreservice.getCourses();

  //Setter
  set changeCourseName(String coursename) {
    _courseName = coursename;
  }

  set changeCourseId(String courseID) {
    _courseId = courseID;
  }

  set changeCourseGroup(String courseGroup) {
    _courseGroup = courseGroup;
  }

  set changeCourseBatch(String courseBatch) {
    _courseBatch = courseBatch;
  }

  set changeCourseCode(String courseCode) {
    _courseCode = courseCode;
  }

  loadall(Courses courses) {
    if (courses != null) {
      _courseName = courses.courseName;
      _courseId = courses.courseID;
      _courseGroup = courses.courseGroup;
      _courseBatch = courses.courseBatch;
      _courseCode = courses.courseCode;
    }
  }

  saveCourses() {
    if (_courseId == null) {
      //Add
      var newCourses = Courses(
          courseName: _courseName,
          courseID: uuid.v1(),
          courseGroup: _courseGroup,
          courseBatch: _courseBatch,
          courseCode: _courseCode);

      firestoreservice.setCourses(newCourses);
    } else {
      //Edit
      var editCourses = Courses(
          courseName: _courseName,
          courseID: uuid.v1(),
          courseGroup: _courseGroup,
          courseBatch: _courseBatch,
          courseCode: _courseCode);
      firestoreservice.setCourses(editCourses);
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////(User)
}
