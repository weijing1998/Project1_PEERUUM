import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/joinCourses.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/sutdentCoursePage.dart';

class StudentPage extends StatefulWidget {
  final PeerUser users;
  StudentPage({Key key, @required this.users}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  bool atStudentCoursePage = true;
  bool atJoinCourse = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.userName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.email,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 80,
                    ),
                    //Dashboard
                    MaterialButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          atStudentCoursePage = true;
                          atJoinCourse = false;
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
                            'Courses',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    //Form Page
                    MaterialButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          atStudentCoursePage = false;
                          atJoinCourse = false;
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
              child: atStudentCoursePage
                  ? StudentCoursesPage(
                      toggleJoinCourse: toggleJoinCourse,
                      user: widget.users,
                    )
                  : JoinCourse(),
            ),
          ],
        ),
      ),
    );
  }

  void toggleJoinCourse(bool b) {
    setState(() {
      atStudentCoursePage = b;
    });
  }
}
