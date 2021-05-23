import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/joinCourses.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/studentAddedCourse.dart';
import 'package:pepelist/sutdentCoursePage.dart';
import 'package:pepelist/userPage.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {
  final PeerUser users;
  StudentPage({Key key, @required this.users}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  bool atStudentCoursePage = true;
  bool atJoinCourse = false;
  bool atStudentAddedCoursePage = false;
  bool atUserpage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProjectProvider>(context);
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    return Scaffold(
      body: Container(
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
                                vertical: 10, horizontal: 10),
                            child: Container(
                              height: height * 0.09,
                              width: width * 0.09,
                              child: Image.network(
                                'assets/images/logowhite.png',
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.009),
                    CircleAvatar(
                      backgroundImage: NetworkImage('assets/images/header.jpg'),
                      radius: total * 4.5,
                    ),
                    SizedBox(
                      height: height * 0.009,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.userName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: total * 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.matric,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: total * 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.email,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: total * 1.2),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height / 20,
                    ),
                    //Dashboard
                    TextButton(
                      onPressed: () {
                        setState(() {
                          atStudentCoursePage = true;
                          atStudentAddedCoursePage = false;
                          atJoinCourse = false;
                          atUserpage = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.dashboard,
                            size: total * 2.2,
                            color: Colors.white,
                          ),
                          SizedBox(width: 26),
                          Text(
                            'Courses',
                            style: TextStyle(
                                fontSize: total * 1.6, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    //Form Page
                    TextButton(
                      onPressed: () {
                        setState(() {
                          atStudentAddedCoursePage = true;
                          atStudentCoursePage = false;
                          atJoinCourse = false;
                          atUserpage = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.dochub,
                            size: total * 2.2,
                            color: Colors.white,
                          ),
                          SizedBox(width: 26),
                          Text(
                            'Added Course',
                            style: TextStyle(
                                fontSize: total * 1.6, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          atStudentAddedCoursePage = false;
                          atStudentCoursePage = false;
                          atJoinCourse = false;
                          atUserpage = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.user,
                            size: total * 2.2,
                            color: Colors.white,
                          ),
                          SizedBox(width: 26),
                          Text(
                            'User Page',
                            style: TextStyle(
                                fontSize: total * 1.6, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 6),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            size: total * 2.2,
                            color: Colors.white,
                          ),
                          SizedBox(width: 26),
                          Text(
                            'Sign out',
                            style: TextStyle(
                                fontSize: total * 1.6, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<Courses>>(
                stream: provider.courselist,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      child: getPage(snapshot.data),
                    );
                  } else {
                    return Container(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  getPage(List<Courses> data) {
    if (atStudentCoursePage == true) {
      return StudentCoursesPage(
        toggleJoinCourse: toggleJoinCourse,
        user: widget.users,
      );
    } else if (atStudentAddedCoursePage == true) {
      return StudentAddedCoursesPage(
        toggleJoinCourse: toggleJoinCoursefromAddedCourses,
        user: widget.users,
        courselist: data,
      );
    } else if (atJoinCourse == true) {
      return JoinCourse(
        leavecourse: toggleLeaveCoursefromAddedCourses,
        user: widget.users,
      );
    } else if (atUserpage == true) {
      return UserPage(user: widget.users);
    }
  }

  void toggleJoinCourse(bool b) {
    setState(() {
      atStudentCoursePage = false;
      atJoinCourse = b;
      atUserpage = false;
      atStudentAddedCoursePage = false;
    });
  }

  void toggleJoinCoursefromAddedCourses(bool b) {
    setState(() {
      atStudentAddedCoursePage = false;
      atJoinCourse = b;
      atStudentCoursePage = false;
      atUserpage = false;
    });
  }

  void toggleLeaveCoursefromAddedCourses(bool b) {
    setState(() {
      atStudentAddedCoursePage = false;
      atJoinCourse = false;
      atStudentCoursePage = b;
      atUserpage = false;
    });
  }
}
