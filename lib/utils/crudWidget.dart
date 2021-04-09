import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/evaluatePage.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

//ADD COURSE
class AddCourseDialog extends StatefulWidget {
  AddCourseDialog({
    Key key,
  }) : super(key: key);

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
                              onChanged: (courseName) =>
                                  projectProvider.changeCourseName = courseName,
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
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                              if (_formskey.currentState.validate()) {
                                projectProvider.saveCourses();
                                Navigator.pop(context);
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

//DELETE COURSE
class DeleteCourseDialog extends StatefulWidget {
  final List<Courses> data;
  DeleteCourseDialog({Key key, @required this.data}) : super(key: key);

  @override
  _DeleteCourseDialogState createState() => _DeleteCourseDialogState();
}

class _DeleteCourseDialogState extends State<DeleteCourseDialog> {
  @override
  void initState() {
    list = widget.data;

    super.initState();
  }

  List<Courses> list;
  String valueOfButton;
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);

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
                          value: valueOfButton,
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
                                  child: list.length != 0
                                      ? DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: valueOfButton,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 32,
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15),
                                            onChanged: (newValue) {
                                              setState(() {
                                                valueOfButton = newValue;
                                              });
                                            },
                                            items: list.map((course) {
                                              return DropdownMenuItem(
                                                child: new Text(
                                                  course.courseName,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                value: course.courseID,
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      : Text("No data"),
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
                            onPressed: () {
                              setState(() {
                                provider.deleteCourse(valueOfButton);
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
  final Courses courses;
  final Function resetViewPage;
  EditCourseDialog({
    Key key,
    @required this.resetViewPage,
    @required this.courses,
  }) : super(key: key);

  @override
  _EditCourseDialogState createState() => _EditCourseDialogState();
}

class _EditCourseDialogState extends State<EditCourseDialog> {
  TextEditingController courseName = TextEditingController();
  TextEditingController courseCode = TextEditingController();
  TextEditingController courseGroup = TextEditingController();
  TextEditingController courseBatch = TextEditingController();

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
                              onChanged: (string) => projectProvider
                                  .changeCourseName = courseName.text,
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
                              onChanged: (string) => projectProvider
                                  .changeCourseCode = courseCode.text,
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
                              onChanged: (string) => projectProvider
                                  .changeCourseGroup = courseGroup.text,
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
                              onChanged: (string) => projectProvider
                                  .changeCourseBatch = courseBatch.text,
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
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  projectProvider.editCourses(widget.courses);
                                  Navigator.pop(context);
                                });
                              }
                              widget.resetViewPage();
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

  AddGroupDialog({
    Key key,
    @required this.course,
  }) : super(key: key);

  @override
  _AddGroupDialogState createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  TextEditingController groupName = TextEditingController();
  TextEditingController groupID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
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
                              onChanged: (String value) =>
                                  provider.changeGroupName = value,
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
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  provider.addGrouptoCourse(widget.course);
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

  DeleteGroupDialog({
    Key key,
    @required this.course,
  }) : super(key: key);

  @override
  _DeleteGroupDialogState createState() => _DeleteGroupDialogState();
}

class _DeleteGroupDialogState extends State<DeleteGroupDialog> {
  Map<String, dynamic> group;
  List listofgroup;
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;

  @override
  void initState() {
    listofgroup = widget.course.listOfGroup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
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
                          value: group,
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
                                      value: group,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          group = newValue;
                                          print(group["groupname"]);
                                        });
                                      },
                                      items: widget.course.listOfGroup
                                          .map((groups) {
                                        return DropdownMenuItem(
                                          child: new Text(groups["groupname"]),
                                          value: groups,
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
                            onPressed: () {
                              setState(() {
                                disableDropdown = true;
                                listofgroup
                                    .removeWhere((element) => element == group);
                                print(listofgroup.length);
                                provider.deleteGroupfromCourse(
                                    widget.course, listofgroup);
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

  EditGroupDialog({
    Key key,
    @required this.course,
  }) : super(key: key);

  @override
  _EditGroupDialogState createState() => _EditGroupDialogState();
}

class _EditGroupDialogState extends State<EditGroupDialog> {
  TextEditingController groupnameController = TextEditingController();
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;
  Map<String, dynamic> group;
  List listofgroup;

  @override
  void initState() {
    super.initState();
    listofgroup = widget.course.listOfGroup;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
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
                          value: group,
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
                                      value: group,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          group = newValue;
                                        });
                                      },
                                      items: widget.course.listOfGroup
                                          .map((groups) {
                                        return DropdownMenuItem(
                                          child: new Text(groups["groupname"]),
                                          value: groups,
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
                              controller: groupnameController,
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
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                for (Map<String, dynamic> g in listofgroup) {
                                  if (group["groupname"] == g["groupname"]) {
                                    setState(() {
                                      disableDropdown = true;
                                      g["groupname"] = groupnameController.text;
                                    });
                                    provider.editGroupfromCourse(
                                        widget.course, listofgroup);
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
  AddFormDialog({Key key}) : super(key: key);

  @override
  _AddFormDialogState createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  TextEditingController formName = TextEditingController();
  TextEditingController formID = TextEditingController();
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
                              onChanged: (String value) =>
                                  projectProvider.changeFormName = value,
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
                            "Form Code : ",
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
                              onChanged: (value) =>
                                  projectProvider.changeFormCode = value,
                              controller: formID,
                              decoration: new InputDecoration(
                                labelText: "Form Code",
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
                                  projectProvider.saveForm();
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
  final List<Forms> forms;
  DeleteFormDialog({
    Key key,
    @required this.forms,
  }) : super(key: key);

  @override
  _DeleteFormDialogState createState() => _DeleteFormDialogState();
}

class _DeleteFormDialogState extends State<DeleteFormDialog> {
  @override
  void initState() {
    forms = widget.forms;
    super.initState();
  }

  List<Forms> forms;
  String value;
  var _formskey = GlobalKey<FormState>();

  bool disableDropdown = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
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
                          value: value,
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
                                      value: value,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          value = newValue;
                                        });
                                      },
                                      items: widget.forms.map((form) {
                                        return DropdownMenuItem(
                                          child: new Text(
                                            form.formName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: form.formID,
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
                            onPressed: () {
                              provider.deleteForm(value);
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
  EditFormDialog({
    Key key,
    @required this.forms,
  }) : super(key: key);

  @override
  _EditFormDialogState createState() => _EditFormDialogState();
}

class _EditFormDialogState extends State<EditFormDialog> {
  TextEditingController formName = TextEditingController();
  TextEditingController formCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
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
                              onChanged: (string) =>
                                  provider.changeFormName = formName.text,
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
                            "FORM CODE : ",
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
                              onChanged: (string) =>
                                  provider.changeFormCode = formCode.text,
                              controller: formCode,
                              decoration: new InputDecoration(
                                labelText: "FORM CODE",
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
                                  return "Form Code cannot be empty";
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
                            onPressed: () {
                              if (_formskey.currentState.validate()) {
                                setState(() {
                                  provider.editForm(widget.forms);

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

  AddRubricDialog({
    Key key,
    @required this.forms,
  }) : super(key: key);

  @override
  _AddRubricDialogState createState() => _AddRubricDialogState();
}

class _AddRubricDialogState extends State<AddRubricDialog> {
  TextEditingController rubricQuestion = TextEditingController();
  TextEditingController lowScaleText = TextEditingController();
  TextEditingController higherScaleText = TextEditingController();
  String rubricStyle;
  int selectedScaleNumber;
  List<int> scalenumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List mapScalenumber = [];
  List<DynamicWidget> listTextform = [];
  List multiplequestion = [];
  var _formskey = GlobalKey<FormState>();

  addTextForm() {
    listTextform.add(new DynamicWidget());
    setState(() {});
  }

  delteTextForm() {
    listTextform.removeLast();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
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
                              onChanged: (value) =>
                                  provider.changeQuestion = value,
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
                                    provider.changeType = newValue;
                                  });
                                },
                                items: <String>[
                                  "Scale",
                                  "Text",
                                  "Multiple Choice"
                                ].map((style) {
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
                                  height: size.height / 4,
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            //Number of scale
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 0, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //Number of scale
                                                  Text(
                                                    "Number of Scale : ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: size.width / 10,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15),
                                                      child: Container(
                                                        width: size.width / 4,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            color: Colors
                                                                .transparent,
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey[
                                                                        600])),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                            value:
                                                                selectedScaleNumber,
                                                            icon: Icon(Icons
                                                                .arrow_drop_down),
                                                            iconSize: 32,
                                                            elevation: 16,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .purple,
                                                                fontSize: 15),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                selectedScaleNumber =
                                                                    newValue;
                                                                for (int i = 1;
                                                                    i <=
                                                                        newValue;
                                                                    i++) {
                                                                  Map<String,
                                                                          dynamic>
                                                                      map = {
                                                                    "index": i
                                                                  };
                                                                  mapScalenumber
                                                                      .add(map);
                                                                }
                                                              });
                                                            },
                                                            items: scalenumber
                                                                .map((style) {
                                                              return DropdownMenuItem(
                                                                child: new Text(
                                                                  style
                                                                      .toString(),
                                                                ),
                                                                value: style,
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: size.width / 12,
                                                    child: TextFormField(
                                                      onChanged: (value) =>
                                                          provider.changeScaleLowLable =
                                                              value,
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
                                                                      .circular(
                                                                  5.0),
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                          .purple[
                                                                      800]),
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
                                                //Higher Scale Text
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: size.width / 12,
                                                    child: TextFormField(
                                                      onChanged: (value) =>
                                                          provider.changeScaleHighLable =
                                                              value,
                                                      controller:
                                                          higherScaleText,
                                                      decoration:
                                                          new InputDecoration(
                                                        labelText:
                                                            "Higher Scale Text",

                                                        fillColor: Colors.white,
                                                        border:
                                                            new OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0),
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

                                            //Scales
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
                      : rubricStyle == "Text"
                          ?
                          //Text type
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            )
                          : rubricStyle == "Multiple Choice"
                              ?
                              //Multiple type
                              Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        height: size.height / 5,
                                        width: size.width / 2,
                                        child: ListView.builder(
                                          itemCount: listTextform.length,
                                          itemBuilder: (_, index) {
                                            return listTextform[index];
                                          },
                                        ),
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Container(
                                                height: size.height / 20,
                                                width: size.width / 20,
                                                child: IconButton(
                                                  color: Colors.blue,
                                                  onPressed: addTextForm,
                                                  icon: Icon(
                                                    FontAwesomeIcons.plus,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Container(
                                                height: size.height / 20,
                                                width: size.width / 20,
                                                child: IconButton(
                                                  color: Colors.blue,
                                                  onPressed:
                                                      listTextform.length == 0
                                                          ? () {}
                                                          : delteTextForm,
                                                  icon: Icon(
                                                      FontAwesomeIcons.minus),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ],
                                  ),
                                )
                              : Container(),

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
                                listTextform.forEach((element) {
                                  Map<String, dynamic> map = {
                                    "option": element.option.text ?? "No Value",
                                    "value": int.parse(element.value.text) ??
                                        "No Value",
                                  };
                                  multiplequestion.add(map);
                                });
                                provider.addRubrictoForm(widget.forms,
                                    mapScalenumber, multiplequestion);
                                Navigator.pop(context);
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

// ignore: must_be_immutable
class DynamicWidget extends StatelessWidget {
  TextEditingController option = TextEditingController();
  TextEditingController value = TextEditingController();
  var formskeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      width: size.width / 14,
      child: Form(
        key: formskeys,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: size.width / 4,
                child: TextFormField(
                  controller: option,
                  decoration: new InputDecoration(
                    labelText: "Option",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Option cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: size.width / 10,
                child: TextFormField(
                  controller: value,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: new InputDecoration(
                    labelText: "Value",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Value cannot be empty";
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
    );
  }
}

class ApplyFormDialog extends StatefulWidget {
  final Forms forms;
  final List<Courses> snapshot;
  ApplyFormDialog({Key key, @required this.forms, @required this.snapshot})
      : super(key: key);

  @override
  _ApplyFormDialogState createState() => _ApplyFormDialogState();
}

Courses course;

class _ApplyFormDialogState extends State<ApplyFormDialog> {
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
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
                          value: course ?? widget.snapshot[0],
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
                                    child: DropdownButton<Courses>(
                                      value: course,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 32,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.purple[800],
                                          fontSize: 15),
                                      onChanged: (newValue) {
                                        setState(() {
                                          course = newValue;
                                          provider.changeCourse = newValue;
                                          print(provider.course.courseID);
                                        });
                                      },
                                      items: widget.snapshot.map((snapcourse) {
                                        return DropdownMenuItem<Courses>(
                                          child: new Text(
                                            snapcourse.courseName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: snapcourse,
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
                              course = null;
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
                            onPressed: () {
                              setState(() {
                                provider.applyFormtoCourse(
                                        widget.forms, context)
                                    ? successAlert(context)
                                    : failAlert(context);
                                course = null;
                              });
                              disableDropdown = true;
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

  successAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Apply successfully"),
      content: Text('The form is applied successfully'),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  failAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Apply Fail"),
      content: Text('System detect duplicate form apply'),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}

class DeleteFormFromCourse extends StatefulWidget {
  final Courses course;

  DeleteFormFromCourse({Key key, this.course}) : super(key: key);

  @override
  _DeleteFormFromCourseState createState() => _DeleteFormFromCourseState();
}

@override
class _DeleteFormFromCourseState extends State<DeleteFormFromCourse> {
  List list;
  bool disableDropdown = false;
  var value;

  void initState() {
    super.initState();
    list = widget.course.listOfForm;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
        content: Stack(clipBehavior: Clip.none, children: <Widget>[
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
                    value: value,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 50,
                            width: size.width / 5,
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey[600])),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: value,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 32,
                                elevation: 16,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                                onChanged: (newValue) {
                                  setState(() {
                                    value = newValue;
                                  });
                                },
                                items: widget.course.listOfForm.map((form) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      form["formname"],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: form['formid'],
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
                      onPressed: () {
                        list.removeWhere(
                            (element) => element["formid"] == value);
                        provider.deleteFormFromCourse(widget.course, list);
                        disableDropdown = true;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]));
  }
}

class StudentChooseForm extends StatefulWidget {
  final Courses course;
  final PeerUser evaluateUser;
  final PeerUser currentUser;
  final Group group;
  StudentChooseForm(
      {Key key,
      @required this.course,
      @required this.evaluateUser,
      @required this.currentUser,@required this.group})
      : super(key: key);

  @override
  _StudentChooseFormState createState() => _StudentChooseFormState();
}

var value;

class _StudentChooseFormState extends State<StudentChooseForm> {
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool disableDropdown = false;

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "CHOOSE FORM TO EVALUATE",
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                disableDropdown
                    ? DropdownButton(
                        value: value,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                        onChanged: (newValue) {},
                        items: [],
                      )
                    : widget.course.listOfForm.length != 0
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SELECTED FORM : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    height: 50,
                                    width: size.width / 5,
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Colors.grey[600])),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: value,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 32,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                        onChanged: (newValue) {
                                          setState(() {
                                            value = newValue;
                                          });
                                        },
                                        items: widget.course.listOfForm
                                            .map((form) {
                                          return DropdownMenuItem(
                                            child: new Text(
                                              form["formname"],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            value: form,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text("No Form to choose"),

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
                            value = null;
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
                            "Evaluate",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            setState(() {
                              Forms form = Forms.fromJson(value);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChangeNotifierProvider(
                                    create: (context) => ProjectProvider(),
                                    builder: (context, child) => EvaluatePage(
                                      forms: form,
                                      evaluateUser: widget.evaluateUser,
                                      course: widget.course,
                                      currentUser: widget.currentUser,
                                      group: widget.group,
                                    ),
                                  ),
                                ),
                              );

                              value = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
