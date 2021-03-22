import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/data.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
import 'package:pepelist/objects/rubric.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

Crudmethod crud = Crudmethod();

//ADD COURSE
class AddCourseDialog extends StatefulWidget {
  final Data data;
  final Function reset;
  AddCourseDialog({Key key, @required this.data, @required this.reset})
      : super(key: key);

  @override
  _AddCourseDialogState createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  TextEditingController courseName = TextEditingController();
  TextEditingController courseCode = TextEditingController();
  TextEditingController courseGroup = TextEditingController();
  TextEditingController courseBatch = TextEditingController();
  String initcn;

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.5,
            width: size.width / 2,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "ADD COURSE",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  //Add course name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: courseName,
                              initialValue: initcn,
                              onChanged: (courseName)=>
                                  projectProvider.changeCourseName= courseName,
                              decoration: new InputDecoration(
                                labelText: "Course Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Add Course ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "COURSE CODE : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              onChanged: (String value) =>
                                  projectProvider.changeCourseCode = value,
                              controller: courseCode,
                              decoration: new InputDecoration(
                                labelText: "Course Code",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course Code cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Add course group
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE GROUP : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              onChanged: (String value) =>
                                  projectProvider.changeCourseGroup = value,
                              controller: courseGroup,
                              decoration: new InputDecoration(
                                labelText: "Course GROUP",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.group),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course group cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Add courseBatch
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE BATCH : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              onChanged: (String value) =>
                                  projectProvider.changeCourseBatch = value,
                              controller: courseBatch,
                              decoration: new InputDecoration(
                                labelText: "Course Batch",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.calendar_today),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course Batch cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: MaterialButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: MaterialButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () async {
                              projectProvider.saveCourses();
                              Navigator.pop(context);
                              // var courses = Courses(
                              //         courseName.text,
                              //         courseID.text,
                              //         courseGroup.text,
                              //         courseBatch.text)
                              //     .toJson();
                              // await crud.addCourse(courses);
                              // if (_formskey.currentState.validate()) {
                              //   setState(() {
                              //     widget.data.courses.add(
                              //       Courses(courseName.text, courseID.text,
                              //           courseGroup.text, courseBatch.text),
                              //     );
                              //     widget.reset();
                              //     print(widget.data.courses.length);
                              //     Navigator.pop(context);
                              //   });
                              // }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//DELETE COURSE
class DeleteCourseDialog extends StatefulWidget {
  final Data data;
  final Function resetViewPage;
  DeleteCourseDialog(
      {Key key, @required this.data, @required this.resetViewPage})
      : super(key: key);

  @override
  _DeleteCourseDialogState createState() => _DeleteCourseDialogState();
}

class _DeleteCourseDialogState extends State<DeleteCourseDialog> {
  @override
  void initState() {
    widget.data.courses.length != 0
        ? coursenameController.text = widget.data.courses[0].courseName
        : coursenameController.text = "";
  }

  TextEditingController coursenameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.8,
            width: size.width / 2.4,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "DELETE COURSE",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  disableDropdown
                      ? DropdownButton(
                          value: coursenameController.text,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          onChanged: (newValue) {},
                          items: [],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SELECTED GROUP : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 50,
                                  width: size.width / 5,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.transparent,
                                      border:
                                          Border.all(color: Colors.grey[600])),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: coursenameController.text,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          coursenameController.text = newValue;
                                        });
                                      },
                                      items: widget.data.courses.map((course) {
                                        return DropdownMenuItem(
                                          child: new Text(
                                            course.courseName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: course.courseName,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                widget.data.courses.removeWhere((course) =>
                                    course.courseName ==
                                    coursenameController.text);
                                widget.resetViewPage();
                                disableDropdown = true;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//EDIT COURSE BUTTON
class EditCourseDialog extends StatefulWidget {
  final Courses course;
  final Function resetViewPage;
  EditCourseDialog(
      {Key key, @required this.course, @required this.resetViewPage})
      : super(key: key);

  @override
  _EditCourseDialogState createState() => _EditCourseDialogState();
}

class _EditCourseDialogState extends State<EditCourseDialog> {
  TextEditingController courseName = TextEditingController();
  TextEditingController courseID = TextEditingController();
  TextEditingController courseGroup = TextEditingController();
  TextEditingController courseBatch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.5,
            width: size.width / 2,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "EDIT COURSE",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  //Edit course name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: courseName,
                              decoration: new InputDecoration(
                                labelText: "Course Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Edit Course ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "COURSE ID : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: courseID,
                              decoration: new InputDecoration(
                                labelText: "Course ID",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course ID cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Edit course group
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE GROUP : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: courseGroup,
                              decoration: new InputDecoration(
                                labelText: "Course GROUP",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.group),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course group cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Edit courseBatch
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COURSE BATCH : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: courseBatch,
                              decoration: new InputDecoration(
                                labelText: "Course Batch",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.calendar_today),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Course Batch cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  widget.course.courseName = courseName.text;
                                  widget.course.courseID = courseID.text;
                                  widget.course.courseGroup = courseGroup.text;
                                  widget.course.courseBatch = courseBatch.text;
                                  widget.resetViewPage();
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//ADD GROUP BUTTON
class AddGroupDialog extends StatefulWidget {
  final Courses course;
  final Function resetViewPage;
  AddGroupDialog({Key key, @required this.course, @required this.resetViewPage})
      : super(key: key);

  @override
  _AddGroupDialogState createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  TextEditingController groupName = TextEditingController();
  TextEditingController groupID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.5,
            width: size.width / 2,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "ADD GROUP",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  //Add course name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GROUP NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: groupName,
                              decoration: new InputDecoration(
                                labelText: "Group Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Group Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Add Course ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "GROUP ID : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: groupID,
                              decoration: new InputDecoration(
                                labelText: "Group ID",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Group ID cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  widget.course.listOfGroup.add(
                                    Group(
                                      groupName.text,
                                      groupID.text,
                                    ),
                                  );
                                  widget.resetViewPage();
                                  //groupname.add(groupName.text);
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//DELETE GROUP BUTTON
class DeleteGroupDialog extends StatefulWidget {
  final Courses course;
  final Function resetViewPage;
  DeleteGroupDialog(
      {Key key, @required this.course, @required this.resetViewPage})
      : super(key: key);

  @override
  _DeleteGroupDialogState createState() => _DeleteGroupDialogState();
}

class _DeleteGroupDialogState extends State<DeleteGroupDialog> {
  TextEditingController groupnameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;

  @override
  void initState() {
    widget.course.listOfGroup.length != 0
        ? groupnameController.text = widget.course.listOfGroup[0].groupName
        : groupnameController.text = "No group";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 2.5,
            width: size.width / 3,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "DELETE GROUP",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  disableDropdown
                      ? DropdownButton(
                          value: groupnameController.text,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          onChanged: (newValue) {},
                          items: [],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SELECTED GROUP : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 50,
                                  width: size.width / 14,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.transparent,
                                      border:
                                          Border.all(color: Colors.grey[600])),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: groupnameController.text,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          groupnameController.text = newValue;
                                        });
                                      },
                                      items: widget.course.listOfGroup
                                          .map((groups) {
                                        return DropdownMenuItem(
                                          child: new Text(groups.groupName),
                                          value: groups.groupName,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                print(widget.course.listOfGroup.length);
                                disableDropdown = true;
                                widget.course.listOfGroup.removeWhere(
                                    (groups) =>
                                        groups.groupName ==
                                        groupnameController.text);
                                widget.resetViewPage();
                                print("FOund");
                                print(widget.course.listOfGroup.length);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//EDIT GROUP BUTTON
class EditGroupDialog extends StatefulWidget {
  final Courses course;
  final Function resetViewPage;

  EditGroupDialog(
      {Key key, @required this.course, @required this.resetViewPage})
      : super(key: key);

  @override
  _EditGroupDialogState createState() => _EditGroupDialogState();
}

class _EditGroupDialogState extends State<EditGroupDialog> {
  TextEditingController groupName = TextEditingController();
  TextEditingController groupID = TextEditingController();
  TextEditingController groupnameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;

  @override
  void initState() {
    widget.course.listOfGroup.length != 0
        ? groupnameController.text = widget.course.listOfGroup[0].groupName
        : groupnameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.5,
            width: size.width / 2,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "EDIT GROUP",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  disableDropdown
                      ? DropdownButton(
                          value: groupnameController.text,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          onChanged: (newValue) {},
                          items: [],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SELECTED GROUP : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 50,
                                  width: size.width / 14,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.transparent,
                                      border:
                                          Border.all(color: Colors.grey[600])),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: groupnameController.text,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          groupnameController.text = newValue;
                                        });
                                      },
                                      items: widget.course.listOfGroup
                                          .map((groups) {
                                        return DropdownMenuItem(
                                          child: new Text(groups.groupName),
                                          value: groups.groupName,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Edit course name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GROUP NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: groupName,
                              decoration: new InputDecoration(
                                labelText: "Group Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Group Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Edit Course ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "GROUP ID : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: groupID,
                              decoration: new InputDecoration(
                                labelText: "Group ID",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Group ID cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                for (Group g in widget.course.listOfGroup) {
                                  if (groupnameController.text == g.groupName) {
                                    setState(() {
                                      disableDropdown = true;
                                      g.groupName = groupName.text;
                                      g.groupID = groupID.text;
                                      widget.resetViewPage();
                                    });
                                    Navigator.pop(context);
                                    break;
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Add form dialog
class AddFormDialog extends StatefulWidget {
  final Data data;
  final Function resetFromPage;
  AddFormDialog({Key key, @required this.data, @required this.resetFromPage})
      : super(key: key);

  @override
  _AddFormDialogState createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  TextEditingController formName = TextEditingController();
  TextEditingController formID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 2.5,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "ADD FORM",
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  //Add form name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FORM NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: formName,
                              decoration: new InputDecoration(
                                labelText: "Form Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Form Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Add Form ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "Form ID : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: formID,
                              decoration: new InputDecoration(
                                labelText: "Form ID",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Form ID cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.purple[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  widget.data.forms
                                      .add(Forms(formName.text, formID.text));
                                  widget.resetFromPage();
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteFormDialog extends StatefulWidget {
  final Data data;
  final Function refreshformpage;
  DeleteFormDialog(
      {Key key, @required this.data, @required this.refreshformpage})
      : super(key: key);

  @override
  _DeleteFormDialogState createState() => _DeleteFormDialogState();
}

class _DeleteFormDialogState extends State<DeleteFormDialog> {
  @override
  void initState() {
    widget.data.forms.length != 0
        ? formnameController.text = widget.data.forms[0].formName
        : formnameController.text = "";
  }

  TextEditingController formnameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.8,
            width: size.width / 2.4,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "DELETE FORM",
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  disableDropdown
                      ? DropdownButton(
                          value: formnameController.text,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          onChanged: (newValue) {},
                          items: [],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SELECTED FORM : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 50,
                                  width: size.width / 5,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.transparent,
                                      border:
                                          Border.all(color: Colors.grey[600])),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: formnameController.text,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          formnameController.text = newValue;
                                        });
                                      },
                                      items: widget.data.forms.map((form) {
                                        return DropdownMenuItem(
                                          child: new Text(
                                            form.formName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: form.formName,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                widget.data.forms.removeWhere((form) =>
                                    form.formName == formnameController.text);
                                widget.refreshformpage();
                                disableDropdown = true;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditFormDialog extends StatefulWidget {
  final Forms forms;
  final Function resetViewFormPage;
  EditFormDialog(
      {Key key, @required this.forms, @required this.resetViewFormPage})
      : super(key: key);

  @override
  _EditFormDialogState createState() => _EditFormDialogState();
}

class _EditFormDialogState extends State<EditFormDialog> {
  TextEditingController formName = TextEditingController();
  TextEditingController formID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 2,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "EDIT FORM",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  //Edit FORM name
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FORM NAME : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: formName,
                              decoration: new InputDecoration(
                                labelText: "Form Name",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Form Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Edit Form ID
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            "FORM ID : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: formID,
                              decoration: new InputDecoration(
                                labelText: "FORM ID",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.article),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Form ID cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  widget.forms.formName = formName.text;
                                  widget.forms.formID = formID.text;

                                  widget.resetViewFormPage();
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddRubricDialog extends StatefulWidget {
  final Forms forms;
  final Function resetViewFormPage;

  AddRubricDialog(
      {Key key, @required this.forms, @required this.resetViewFormPage})
      : super(key: key);

  @override
  _AddRubricDialogState createState() => _AddRubricDialogState();
}

class _AddRubricDialogState extends State<AddRubricDialog> {
  TextEditingController rubricQuestion = TextEditingController();
  TextEditingController lowScaleText = TextEditingController();
  TextEditingController higherScaleText = TextEditingController();
  String rubricStyle = "Scale";
  int selectedRadio;

  void setSelectedRadio(int radio) {
    setState(() {
      selectedRadio = radio;
    });
  }

  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _formskey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.2,
            width: size.width / 1.6,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "ADD RUBRIC",
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  //RUBRIC question
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rubric Question : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: size.width / 4,
                            child: TextFormField(
                              controller: rubricQuestion,
                              decoration: new InputDecoration(
                                labelText: "Rubric Question",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Icon(Icons.book),
                                ),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Form Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Rubric Style
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rubric Style : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: size.width / 4,
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey[600])),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: rubricStyle,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 32,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 15),
                                onChanged: (newValue) {
                                  setState(() {
                                    rubricStyle = newValue;
                                  });
                                },
                                items: <String>["Scale", "Text"].map((style) {
                                  return DropdownMenuItem(
                                    child: new Text(style),
                                    value: style,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Option
                  rubricStyle == "Scale"
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Example of Rubric : ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: size.height / 5,
                                  width: size.width / 2,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.blueAccent, width: 1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Question*",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      //Lower Scale Text
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                width: size.width / 12,
                                                child: TextFormField(
                                                  cursorColor:
                                                      Colors.purple[800],
                                                  controller: lowScaleText,
                                                  decoration:
                                                      new InputDecoration(
                                                    labelText:
                                                        "Lower Scale Text",
                                                    focusColor:
                                                        Colors.purple[800],
                                                    hoverColor:
                                                        Colors.purple[800],

                                                    fillColor: Colors.white,
                                                    border:
                                                        new OutlineInputBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(5.0),
                                                      borderSide:
                                                          new BorderSide(
                                                              color: Colors
                                                                  .purple[800]),
                                                    ),
                                                    //fillColor: Colors.green
                                                  ),
                                                  validator: (val) {
                                                    if (val.isEmpty) {
                                                      return "Lower Scale Text cannot be empty";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            //Scales
                                            Row(
                                              children: <Widget>[
                                                ButtonBar(
                                                  alignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("1"),
                                                        Radio(
                                                            value: 1,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("2"),
                                                        Radio(
                                                            value: 2,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("3"),
                                                        Radio(
                                                            value: 3,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("4"),
                                                        Radio(
                                                            value: 4,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("5"),
                                                        Radio(
                                                            value: 5,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("6"),
                                                        Radio(
                                                            value: 6,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("7"),
                                                        Radio(
                                                            value: 7,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("8"),
                                                        Radio(
                                                            value: 8,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("9"),
                                                        Radio(
                                                            value: 9,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("10"),
                                                        Radio(
                                                            value: 10,
                                                            groupValue:
                                                                selectedRadio,
                                                            activeColor: Colors
                                                                .purple[700],
                                                            onChanged: (val) {
                                                              print(
                                                                  "Radio $val");
                                                              setSelectedRadio(
                                                                  val);
                                                            }),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //Higher Scale Text
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                width: size.width / 12,
                                                child: TextFormField(
                                                  controller: higherScaleText,
                                                  decoration:
                                                      new InputDecoration(
                                                    labelText:
                                                        "Higher Scale Text",

                                                    fillColor: Colors.white,
                                                    border:
                                                        new OutlineInputBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(5.0),
                                                      borderSide:
                                                          new BorderSide(),
                                                    ),
                                                    //fillColor: Colors.green
                                                  ),
                                                  validator: (val) {
                                                    if (val.isEmpty) {
                                                      return "Higher Scale Text cannot be empty";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: size.height / 5,
                                  width: size.width / 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.purple[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  rubricStyle == "Scale"
                                      ? widget.forms.listOfRubric.add(
                                          Rubric(
                                              rubricQuestion.text,
                                              rubricStyle,
                                              "",
                                              "",
                                              higherScaleText.text,
                                              lowScaleText.text),
                                        )
                                      : widget.forms.listOfRubric.add(Rubric(
                                          rubricQuestion.text,
                                          rubricStyle,
                                          "",
                                          "",
                                          "",
                                          ""));
                                  widget.resetViewFormPage();
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ApplyFormDialog extends StatefulWidget {
  final Data data;
  final Forms forms;

  ApplyFormDialog({Key key, @required this.data, @required this.forms})
      : super(key: key);

  @override
  _ApplyFormDialogState createState() => _ApplyFormDialogState();
}

class _ApplyFormDialogState extends State<ApplyFormDialog> {
  TextEditingController coursenameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;

  void initState() {
    widget.data.courses.length != 0
        ? coursenameController.text = widget.data.courses[0].courseName
        : coursenameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            height: size.height / 1.8,
            width: size.width / 2.4,
            child: Form(
              key: _formskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "APPLY FORM",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  disableDropdown
                      ? DropdownButton(
                          value: coursenameController.text,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          onChanged: (newValue) {},
                          items: [],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Apply " + widget.forms.formName + " to : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 50,
                                  width: size.width / 5,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.transparent,
                                      border:
                                          Border.all(color: Colors.grey[600])),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: coursenameController.text,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.purple[800],
                                          fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          coursenameController.text = newValue;
                                        });
                                      },
                                      items: widget.data.courses.map((course) {
                                        return DropdownMenuItem(
                                          child: new Text(
                                            course.courseName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: course.courseName,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  //Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.red[800],
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                for (Courses c in widget.data.courses) {
                                  if (c.courseName ==
                                      coursenameController.text) {
                                    c.listOfForm.add(widget.forms);
                                    break;
                                  }
                                }
                                disableDropdown = true;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
