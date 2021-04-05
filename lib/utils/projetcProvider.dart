import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
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
          listOfGroup: [],
          listOfStudent: []);

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
        listOfGroup: course.listOfGroup,
        listOfStudent: course.listOfStudent);
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

  addStudentToCourse(Courses course, PeerUser user) {
    List student = course.listOfStudent;
    bool validator = true;
    for (var i = 0; i < student.length; i++) {
      // you may have to check the equality operator
      if (student[i]["email"] == user.email) {
        validator = false;
        break;
      }
    }

    if (validator == true) {
      student.add(user.toJson());
      var newCourse = Courses(
          courseName: course.courseName,
          courseID: course.courseID,
          courseBatch: course.courseBatch,
          courseCode: course.courseCode,
          courseGroup: course.courseGroup,
          listOfForm: course.listOfForm,
          listOfGroup: course.listOfGroup,
          listOfStudent: student);
      firestoreservice.setCourses(newCourse);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  leaveCourses(Courses course, PeerUser user) {
    List studentList = course.listOfStudent;
    studentList.removeWhere((element) => element['name'] == user.userName);
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: course.listOfGroup,
        listOfStudent: studentList);
    firestoreservice.setCourses(newCourse);
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
  Stream<List<Map<String, dynamic>>> get listofrubric =>
      firestoreservice.getListOfRubric();

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

  applyFormtoCourse(Forms forms, context) {
    List newlist = course.listOfForm;
    bool validator = true;
    for (var i = 0; i < newlist.length; i++) {
      // you may have to check the equality operator
      if (forms.formID == newlist[i]['formid']) {
        validator = false;
        print('same form');
        break;
      }
    }

    if (validator == true) {
      newlist.add(forms.toJson());
      var newCourse = Courses(
          courseName: course.courseName,
          courseID: course.courseID,
          courseBatch: course.courseBatch,
          courseCode: course.courseCode,
          courseGroup: course.courseGroup,
          listOfForm: newlist,
          listOfGroup: course.listOfGroup,
          listOfStudent: course.listOfStudent);
      firestoreservice.setCourses(newCourse);
      notifyListeners();
      return true;
    } else {
      print('same form');
      return false;
    }
  }

  deleteFormFromCourse(Courses course, List list) {
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: list,
        listOfGroup: course.listOfGroup,
        listOfStudent: course.listOfStudent);
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
  ////////////////////////////////////////(Forms)

  ///////////////////////////////////////(Groups)
  String _groupName;
  String _groupId;

  String get groupName => _groupName;
  String get groupId => _groupId;
  Stream<Group> get group => firestoreservice.getGroups(_groupId);
  Stream<List<Group>> get groupList => firestoreservice.getGroupList();

  set changeGroupName(String groupName) {
    _groupName = groupName;
  }

  setGroupId(String groupId) {
    _groupId = groupId;
    notifyListeners();
  }

  deleteGroup(String groupId) {
    firestoreservice.deleteGroup(groupId);
  }

  editGroup(Group group) {
    var newGroup = Group(
      groupName: _groupName,
      groupID: group.groupID,
      listofStudent: group.listofStudent,
    );
    firestoreservice.setGroup(newGroup);
    notifyListeners();
  }

  addGrouptoCourse(Courses course) {
    Group group =
        Group(groupID: uuid.v1(), groupName: _groupName, listofStudent: []);
    List newlist = course.listOfGroup;
    newlist.add(group.toJson());
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: newlist,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }

  deleteGroupfromCourse(Courses course, List listofgroup) {
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: listofgroup,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }

  editGroupfromCourse(Courses course, List listofgroup) {
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: listofgroup,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }

  addStudentToGroup(Courses course, List lg, int index) {
    List listofstudent = lg;
    List listofgroup = course.listOfGroup;

    
    listofgroup[index]["listofstudent"] = listofstudent;

    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: listofgroup,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }

  deleteStudentFromGroup(Courses course, PeerUser user) {
    List listofstudent = course.listOfGroup;
    listofstudent.removeWhere((element) => element['email'] == user.email);
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: listofstudent,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }
  ///////////////////////////////////////(Groups)

  ///////////////////////////////////////(Rubric)
  String _question = "";
  String _type = "";
  String _scaleAnswer = "";
  String _textAnswer = '';
  String _scaleHighLable = '';
  String _scaleLowLable = '';
  String _rubricId;
  List _numberOfScale = [];

  String get question => _question;
  String get type => _type;
  String get scaleAnswer => _scaleAnswer;
  String get textAnswer => _textAnswer;
  String get scaleHighLable => _scaleHighLable;
  String get scaleLowLable => _scaleLowLable;
  String get rubricId => _rubricId;
  List get numberOfScale => _numberOfScale;

  set changeQuestion(String question) {
    _question = question;
  }

  set changeType(String type) {
    _type = type;
  }

  set changeScaleAnswer(String scaleAnswer) {
    _scaleAnswer = scaleAnswer;
  }

  set changeTextAnswer(String textAnswer) {
    _textAnswer = textAnswer;
  }

  set changeScaleHighLable(String scaleHighLable) {
    _scaleHighLable = scaleHighLable;
  }

  set changeScaleLowLable(String scaleLowLable) {
    _scaleLowLable = scaleLowLable;
  }

  set changeNumberOfScale(List nfs) {
    _numberOfScale = nfs;
  }

  setRubricId(String rubricId) {
    _rubricId = rubricId;
    notifyListeners();
  }

  addRubrictoForm(
      Forms form, List numberofscalelist, List multipleQuestionlist) {
    Rubric rubric = Rubric(
        question: question,
        rubricId: uuid.v1(),
        scaleAnswer: scaleAnswer,
        scaleHighLable: scaleHighLable,
        scaleLowLable: scaleLowLable,
        textAnswer: textAnswer,
        type: type,
        numberOfscale: numberofscalelist,
        multipleQuestion: multipleQuestionlist);
    List newlist = form.listOfRubric;
    newlist.add(rubric.toJson());
    var newForm = Forms(
      formID: form.formID,
      formCode: form.formCode,
      formName: form.formName,
      listOfRubric: newlist,
    );
    firestoreservice.setForms(newForm);
    notifyListeners();
  }

  deleteRubricfromForm(Forms forms, List listofRubric) {
    var newForm = Forms(
      formID: forms.formID,
      formCode: forms.formCode,
      formName: forms.formName,
      listOfRubric: listofRubric,
    );
    firestoreservice.setForms(newForm);
  }

  editRubricfromForm(Courses course, List listofgroup) {
    var newCourse = Courses(
        courseName: course.courseName,
        courseID: course.courseID,
        courseBatch: course.courseBatch,
        courseCode: course.courseCode,
        courseGroup: course.courseGroup,
        listOfForm: course.listOfForm,
        listOfGroup: listofgroup,
        listOfStudent: course.listOfStudent);
    firestoreservice.setCourses(newCourse);
    notifyListeners();
  }
  ///////////////////////////////////////(Rubric)

}
