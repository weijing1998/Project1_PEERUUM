import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/coursespage.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/viewcourse.dart';

class Sidebar extends StatefulWidget {
  final String email;
  Sidebar({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool atCoursePage = true;
  bool atFormPage = false;
  bool atViewCourse = false;
  bool atViewForm = false;
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
                        Text(
                          widget.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
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
                          atCoursePage = false;
                          atViewCourse = false;
                          atFormPage = true;
                          atViewForm = false;
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
              height: size.height,
              child: atCoursePage
                  ? CoursesPage(
                      toggleViewCourse: toggleViewCourse,
                    )
                  : ViewCourse(),
            )
          ],
        ),
      ),
    );
  }

  void toggleViewCourse(bool b) {
    setState(() {
      atViewCourse = b;
      atCoursePage = false;
    });
  }

  void toggleFormpage(bool b) {
    setState(() {
      atViewForm = b;
    });
  }

  void currentFormIndex(int i) {
    setState(() {
      formIndex = i;
    });
  }
}
