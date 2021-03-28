import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

Crudmethod crud = Crudmethod();

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
                                  // rubricStyle == "Scale"
                                  //     ? widget.forms.listOfRubric.add(
                                  //         Rubric(
                                  //             rubricQuestion.text,
                                  //             rubricStyle,
                                  //             "",
                                  //             "",
                                  //             higherScaleText.text,
                                  //             lowScaleText.text),
                                  //       )
                                  //     : widget.forms.listOfRubric.add(Rubric(
                                  //         rubricQuestion.text,
                                  //         rubricStyle,
                                  //         "",
                                  //         "",
                                  //         "",
                                  //         ""));
                                  // widget.resetViewFormPage();
                                  // Navigator.pop(context);
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
  final Forms forms;

  ApplyFormDialog({Key key, @required this.forms}) : super(key: key);

  @override
  _ApplyFormDialogState createState() => _ApplyFormDialogState();
}

class _ApplyFormDialogState extends State<ApplyFormDialog> {
  var _formskey = GlobalKey<FormState>();
  bool disableDropdown = false;
  Courses course;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<Courses>>(
        stream: provider.courselist,
        builder: (context, snapshot) {
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
                snapshot.hasData
                    ? Container(
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

                              snapshot.data.length < 1
                                  ? DropdownButton(
                                      value: course,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                      onChanged: (newValue) {},
                                      items: [],
                                    )
                                  : disableDropdown
                                      ? DropdownButton(
                                          value: course,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                          onChanged: (newValue) {},
                                          items: [],
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Apply " +
                                                    widget.forms.formName +
                                                    " to : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Container(
                                                  height: 50,
                                                  width: size.width / 5,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey[600])),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<Courses>(
                                                      value: course ??
                                                          snapshot.data[0],
                                                      icon: Icon(Icons
                                                          .arrow_drop_down),
                                                      iconSize: 32,
                                                      elevation: 16,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[800],
                                                          fontSize: 15),
                                                      onChanged: (newValue) {
                                                        course = newValue;
                                                        provider.changeCourse =
                                                            newValue;
                                                        print(provider
                                                            .course.courseID);
                                                      },
                                                      items: snapshot.data
                                                          .map((snapcourse) {
                                                        return DropdownMenuItem<
                                                            Courses>(
                                                          child: new Text(
                                                            snapcourse
                                                                .courseName,
                                                            style: TextStyle(
                                                                fontSize: 12),
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
                                          provider
                                              .applyFormtoCourse(widget.forms);
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
                        ),
                      )
                    : Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                      ),
              ],
            ),
          );
        });
  }
}
