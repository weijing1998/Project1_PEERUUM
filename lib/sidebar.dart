import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/coursespage.dart';
import 'package:pepelist/formpages.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/scorePage.dart';
import 'package:pepelist/userPage.dart';
import 'package:pepelist/viewScore.dart';
import 'package:pepelist/viewcourse.dart';
import 'package:pepelist/viewform.dart';

class Sidebar extends StatefulWidget {
  final PeerUser users;
  Sidebar({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

final firebaseAuth = FirebaseAuth.instance;

class _SidebarState extends State<Sidebar> {
  bool atCoursePage = true;
  bool atFormPage = false;
  bool atViewCourse = false;
  bool atViewForm = false;
  bool atScorePage = false;
  bool atViewScore = false;
  bool atUserPage = false;
  int courseIndex;
  int formIndex;
  PeerUser peeruser;
  //Data data = new Data();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                vertical: 10, horizontal: 20),
                            child: Container(
                              height: height*0.09,
                              width: width*0.09,
                              child: Image.network(
                                'assets/images/logowhite.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    CircleAvatar(
                      backgroundImage: NetworkImage('assets/images/header.jpg'),
                      radius: total *4.5,
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            widget.users.userName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: total *1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.users.email,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize:  total * 1.2),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height / 40  ,
                    ),
                    //Dashboard
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            atCoursePage = true;
                            atFormPage = false;
                            atViewCourse = false;
                            atViewForm = false;
                            atScorePage = false;
                            atViewScore = false;
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
                            SizedBox(width: width * 0.02),
                            Text(
                              'Courses',
                              style:
                                  TextStyle(fontSize: total *1.6, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    //Form Page
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            atCoursePage = false;
                            atViewCourse = false;
                            atFormPage = true;
                            atViewForm = false;
                            atScorePage = false;
                            atViewScore = false;
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
                            SizedBox(width: width * 0.02),
                            Text(
                              'Form',
                              style:
                                  TextStyle(fontSize: total * 1.6, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            atCoursePage = false;
                            atViewCourse = false;
                            atFormPage = false;
                            atViewForm = false;
                            atScorePage = true;
                            atViewScore = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.sortNumericUpAlt,
                              size: total * 2.2,
                              color: Colors.white,
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              'Score',
                              style:
                                  TextStyle(fontSize: total * 1.6, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            atCoursePage = false;
                            atViewCourse = false;
                            atFormPage = false;
                            atViewForm = false;
                            atScorePage = false;
                            atViewScore = false;
                            atUserPage = true;
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
                            SizedBox(width: width * 0.015),
                            Text(
                              'User',
                              style:
                                  TextStyle(fontSize: total * 1.6, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 15),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          firebaseAuth.signOut();
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
                            SizedBox(width: width * 0.02),
                            Text(
                              'Sign out',
                              style:
                                  TextStyle(fontSize: total * 1.6, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height, child: getPage()),
          ],
        ),
      ),
    );
  }

  getPage() {
    if (atCoursePage == true) {
      return CoursesPage(
        toggleViewCourse: toggleViewCourse,
        user: widget.users,
      );
    } else if (atFormPage == true) {
      return FormPage(
        toggleFormpage: toggleViewFormpage,
        user: widget.users,
      );
    } else if (atScorePage == true) {
      return ScorePage(
        toggleViewScore: toggleViewScorepage,
        user: widget.users,
      );
    } else if (atViewCourse == true) {
      return ViewCourse();
    } else if (atViewForm == true) {
      return ViewFormPage();
    } else if (atViewScore == true) {
      return ViewScore();
    } else if (atUserPage == true) {
      return UserPage(
        user: widget.users,
      );
    }
  }

  void toggleViewCourse(bool b) {
    setState(() {
      atViewCourse = b;
      atCoursePage = false;
      atFormPage = false;
      atViewForm = false;
      atScorePage = false;
      atViewScore = false;
    });
  }

  void toggleViewFormpage(bool b) {
    setState(() {
      atViewForm = b;
      atScorePage = false;
      atViewScore = false;
      atViewCourse = false;
      atCoursePage = false;
      atFormPage = false;
    });
  }

  void toggleViewScorepage(bool b) {
    setState(() {
      atViewScore = b;
      atViewForm = false;
      atScorePage = false;
      atViewCourse = false;
      atCoursePage = false;
      atFormPage = false;
    });
  }
}
