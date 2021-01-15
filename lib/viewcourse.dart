import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/sidebar.dart';

class ViewCourse extends StatefulWidget {
  final Courses course;
  final int viewCourseIndex;
  final Data data;

  ViewCourse(
      {Key key,
      @required this.course,
      @required this.viewCourseIndex,
      @required this.data})
      : super(key: key);

  @override
  _ViewCourseState createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width - size.width / 6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width / 14,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Text(
                      "COURSE DETAIL",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.7,
                ),
                Container(
                  child: Row(
                    children: [
                      //Edit Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              _popOutEditCourses(context);
                            },
                            child: Text(
                              "Edit Course",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),

                      // Delete Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.data.courses
                                    .remove(widget.viewCourseIndex);
                                print(Data().courses.length);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sidebar()),
                                );
                              });
                            },
                            child: Text(
                              "Delete Course",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            //Course detail
            Container(
              height: size.height / 3,
              width: size.width / 1.5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE NAME : " + widget.course.courseName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE ID : " + widget.course.courseID,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE GROUP : " + widget.course.courseGroup,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE BATCH : " + widget.course.courseBatch,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "FORM STATUS : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: size.height / 20,
                          width: size.width / 15,
                          decoration: BoxDecoration(
                              color: Colors.red[700],
                              border: Border.all(
                                  width: 3, color: Colors.grey[600])),
                          child: Align(
                            child: Text(
                              "No Form Apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height / 18,
            ),

            //Group detail
            Row(
              children: [
                SizedBox(
                  width: size.width / 14,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Text(
                      "GROUP DETAIL",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.7,
                ),
                Container(
                  child: Row(
                    children: [
                      //Edit Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              _popOutEditCourses(context);
                            },
                            child: Text(
                              "Add Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),

                      // Delete Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.data.courses
                                    .remove(widget.viewCourseIndex);
                                print(Data().courses.length);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sidebar()),
                                );
                              });
                            },
                            child: Text(
                              "Delete Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SingleChildScrollView(
              child: Container(
                height: size.height / 1.45,
                width: size.width / 1.5,
                color: Colors.grey[300],
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.course.listOfGroup.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            height: 600,
                            width: double.infinity,
                            color: Colors.blueGrey[500],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  color: Colors.blueGrey[800],
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.course.listOfGroup[index].groupName
                                          .toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    "GROUP ID : " +
                                        widget
                                            .course.listOfGroup[index].groupID,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    "STUDENT INFO IN " +
                                        widget
                                            .course.listOfGroup[index].groupName
                                            .toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height: size.height / 2.6,
                                      width: size.width / 1.9,
                                      color: Colors.transparent,

                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget.course.listOfGroup[index].groupStudent.length,
                                          itemBuilder:
                                              (context, indexOfStudent) {
                                            return Card(
                                              child: Container(
                                                color: Colors.teal[200],
                                                height: double.infinity,
                                                width: 330,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                'images/header.jpg'),
                                                        radius: 52,
                                                      ),
                                                    ),
                                                    Text(
                                                      "NAME : " +
                                                          widget
                                                              .course
                                                              .listOfGroup[
                                                                  index]
                                                              .groupStudent[indexOfStudent]
                                                              .name,
                                                    ),
                                                     Text(
                                                      "Email : " +
                                                          widget
                                                              .course
                                                              .listOfGroup[
                                                                  index]
                                                              .groupStudent[indexOfStudent]
                                                              .email,
                                                    ),
                                                     Text(
                                                      "Course : " +
                                                          widget
                                                              .course
                                                              .listOfGroup[
                                                                  index]
                                                              .groupStudent[indexOfStudent]
                                                              .course,
                                                    ),
                                                     Text(
                                                      "Telephone No : " +
                                                          widget
                                                              .course
                                                              .listOfGroup[
                                                                index]
                                                              .groupStudent[indexOfStudent]
                                                              .telephone,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: size.height / 4,
            ),
          ],
        ),
      ),
    );
  }

  _popOutEditCourses(context) {
    TextEditingController courseName = TextEditingController();
    TextEditingController courseID = TextEditingController();
    TextEditingController courseGroup = TextEditingController();
    TextEditingController courseBatch = TextEditingController();
    Size size = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        widget.course.courseName =
                                            courseName.text;
                                        widget.course.courseID = courseID.text;
                                        widget.course.courseGroup =
                                            courseGroup.text;
                                        widget.course.courseBatch =
                                            courseBatch.text;

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
        });
  }
  //ADD GROUP
   _popOutAddGroup(context) {
    TextEditingController courseName = TextEditingController();
    TextEditingController courseID = TextEditingController();
    TextEditingController courseGroup = TextEditingController();
    TextEditingController courseBatch = TextEditingController();
    Size size = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        widget.course.courseName =
                                            courseName.text;
                                        widget.course.courseID = courseID.text;
                                        widget.course.courseGroup =
                                            courseGroup.text;
                                        widget.course.courseBatch =
                                            courseBatch.text;

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
        });
  }
  //EDIT GROUP
   _popOutEditCourses(context) {
    TextEditingController courseName = TextEditingController();
    TextEditingController courseID = TextEditingController();
    TextEditingController courseGroup = TextEditingController();
    TextEditingController courseBatch = TextEditingController();
    Size size = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
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
                                        widget.course.courseName =
                                            courseName.text;
                                        widget.course.courseID = courseID.text;
                                        widget.course.courseGroup =
                                            courseGroup.text;
                                        widget.course.courseBatch =
                                            courseBatch.text;

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
        });
  }
}
