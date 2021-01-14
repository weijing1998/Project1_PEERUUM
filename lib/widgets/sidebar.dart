import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/viewcourse.dart';

import '../coursespage.dart';
import '../form.dart';

class Sidebar extends StatefulWidget {
  Data data;
  Sidebar({Key key, @required this.data}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool atCoursePage = true;
  bool atViewCourse = false;
  Courses course;
  int index;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Container(
            color: Color(0xff152238),
            height: size.height,
            width: size.width / 6,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: .1,
                  color: Colors.grey[200],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Image.network(
                            'images/logowhite.png',
                            scale: 1.9,
                          ),
                        ),
                        SizedBox(width: 2),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: NetworkImage('images/header.jpg'),
                    radius: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "WEIJING",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "WEIJING@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  //Dashboard
                  FlatButton(
                    padding: EdgeInsets.all(16),
                    color: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        atCoursePage = true;
                        atViewCourse = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.dashboard,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: 26),
                        Text(
                          'Dashboard',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  //Performance
                  FlatButton(
                    padding: EdgeInsets.all(16),
                    color: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        atCoursePage = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.dochub,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: 26),
                        Text(
                          'Form',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  FlatButton(
                    padding: EdgeInsets.all(16),
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: 26),
                        Text(
                          'Sign out',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height,
            child: atCoursePage
                ? atViewCourse
                    ? ViewCourse(
                        course: course,
                        viewCourseIndex: index,
                        data: widget.data,
                      )
                    : CoursesPage(
                        toggleViewCourse: toggleViewCourse,
                        passCourse: setCourse,
                        setCurrentIndex: currentIndex,
                        data: widget.data,
                      )
                : FormPage(),
          ),
        ],
      ),
    );
  }

  void toggleViewCourse(bool b) {
    setState(() {
      atViewCourse = b;
    });
  }

  void setCourse(Courses c) {
    setState(() {
      course = c;
    });
  }

  void currentIndex(int i) {
    setState(() {
      index = i;
    });
  }
}
