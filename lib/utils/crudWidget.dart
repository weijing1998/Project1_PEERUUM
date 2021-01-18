import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/group.dart';

//ADD COURSE
class AddCourseDialog extends StatefulWidget {
  final Data data;
  final Function reset;
  AddCourseDialog({Key key, @required this.data,@required this.reset}) : super(key: key);

  @override
  _AddCourseDialogState createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
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
                  //Add Course ID
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
                                  widget.data.courses.add(
                                    Courses(courseName.text, courseID.text,
                                        courseGroup.text, courseBatch.text),
                                  );
                                  widget.reset();
                                  print(widget.data.courses.length);
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
    groupnameController.text = widget.course.listOfGroup[0].groupName;
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
    groupnameController.text = widget.course.listOfGroup[0].groupName;
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
