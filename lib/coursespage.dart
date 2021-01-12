import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';

class CoursesPage extends StatefulWidget {
  final Function toggleViewCourse;
  final Function passCourse;

  const CoursesPage({Key key, @required this.toggleViewCourse, @required this.passCourse}) : super(key: key);

  @override
  CoursesPageState createState() => CoursesPageState();
}

class CoursesPageState extends State<CoursesPage> {
  static Data data = new Data();
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width - size.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("WELCOME" + " WEIJING,",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                // TODO : REPLACE WITH SEARC BAR
                SizedBox(
                  width: size.width / 2.5,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: FlatButton(
                    color: Colors.blue[900],
                    focusColor: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () {
                      _popOutCreateCourses(context);
                    },
                    child: Text(
                      "Add Courses",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 0, 10, 0),
                child: Image.network(
                  "images/courses.png",
                  scale: 9,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "COURSES PAGE",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 20,
          ),
          SingleChildScrollView(
            child: Container(
                height: size.height / 1.42,
                width: size.width / 1.3,
                color: Colors.grey[300],
                child: ListView.builder(
                  itemCount: data.courses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.blue[300],
                                height: 50,
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      " COURSE NAME : " +
                                          data.courses[index].courseName
                                              .toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 150,
                                width: double.infinity,
                                color: Colors.blueGrey[50],
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Course ID
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.article,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "COURSE ID : " +
                                                    data.courses[index]
                                                        .courseID,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        //Course Group
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.group,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "COURSE GROUP : " +
                                                    data.courses[index]
                                                        .courseGroup,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        // Course Batch
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "COURSE BATCH : " +
                                                    data.courses[index]
                                                        .courseBatch,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width / 2.2,
                                    ),
                                    Container(
                                      height: 40,
                                      width: size.width / 10,
                                      child: FlatButton(
                                        color: Colors.blue[900],
                                        onPressed: () {
                                          widget.toggleViewCourse(true);
                                          widget
                                              .passCourse(data.courses[index]);
                                        },
                                        child: Text(
                                          "View Couses",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }

  _popOutCreateCourses(context) {
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
                                        data.courses.add(
                                          Courses(
                                              courseName.text,
                                              courseID.text,
                                              courseGroup.text,
                                              courseBatch.text),
                                        );
                                        print(data.courses.length);
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
