import 'package:flutter/cupertino.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/objects/rubric.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:uuid/uuid.dart';

class ProjectProvider with ChangeNotifier {
  final firestoreservice = Crudmethod();
  var uuid = Uuid();
  /////////////////////////////////////(Courses)
  String _courseName;
  String _courseId;
  String _courseGroup;
  String _courseBatch;
  String _courseCode;
  Courses _course;
  List _listOfForms;
  List _listOfGroups = [];

  //Getter
  String get courseName => _courseName;
  String get courseId => _courseId;
  String get courseGroup => _courseGroup;
  String get courseBatch => _courseBatch;
  String get courseCode => _courseCode;
  Courses get course => _course;
  Stream<Courses> get streamCourse => firestoreservice.getCourse(_courseId);
  Stream<List<Courses>> get courselist => firestoreservice.getCoursesList();
  Stream<List<PeerUser>> get userlist => firestoreservice.getUser();

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

  set changeCourse(Courses course) {
    _course = course;
  }

  saveCourses() {
    if (_courseId == null) {
      //Add
      var newCourses = Courses(
          courseName: _courseName,
          courseID: uuid.v1(),
          courseGroup: _courseGroup,
          courseBatch: _courseBatch,
          courseCode: _courseCode,
          listOfForm: [],
          listOfGroup: []);

      firestoreservice.setCourses(newCourses);
    }
  }

  editCourses(Courses course) {
    var newCourses = Courses(
        courseID: course.courseID,
        courseName: _courseName,
        courseBatch: _courseBatch,
        courseCode: _courseCode,
        courseGroup: _courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: course.listOfGroup);
    firestoreservice.setCourses(newCourses);
    notifyListeners();
  }

  deleteCourse(String courseId) {
    firestoreservice.deleteCourses(courseId);
  }

  setCoursesId(String courseId) {
    _courseId = courseId;
    notifyListeners();
  }
  ///////////////////////////////////////////////

  ////////////////////////////////////////(Forms)
  String _formName;
  String _formId;
  String _formCode;
  List<Rubric> _listOfRubric = [];

  //Getter
  String get formName => _formName;
  String get formId => _formId;
  String get formCode => _formCode;
  Stream<Forms> get form => firestoreservice.getForms(_formId);
  Stream<List<Forms>> get formList => firestoreservice.getFormsList();

  //Setter
  set changeFormName(String formname) {
    _formName = formname;
  }

  set changeFormId(String formID) {
    _formId = formID;
  }

  set changeFormCode(String formCode) {
    _formCode = formCode;
  }

  saveForm() {
    if (_formId == null) {
      var newForm = Forms(
        formName: _formName,
        formID: uuid.v1(),
        formCode: _formCode,
        listOfRubric: _listOfRubric,
      );

      firestoreservice.setForms(newForm);
    }
  }

  editForm(Forms form) {
    var newForm = Forms(
      formName: _formName,
      formID: form.formID,
      formCode: _formCode,
      listOfRubric: form.listOfRubric,
    );
    firestoreservice.setForms(newForm);
    notifyListeners();
  }

  applyFormtoCourse(Forms forms) {
    List newlist = course.listOfForm;
    newlist.add(forms.toJson());
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: newlist,
        listOfGroup: course.listOfGroup);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }

  deleteForm(String formId) {
    firestoreservice.deleteForms(formId);
  }

  setFormId(String formId) {
    _formId = formId;
    notifyListeners();
  }

  // List<Map> convertListFormToMap({List customSteps}) {
  //   List<Map> steps = [];
  //   customSteps.forEach((customStep) {
  //     Map step = customStep.toJson();
  //     steps.add(step);
  //   });
  //   return steps;
  // }
}
