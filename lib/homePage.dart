import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/register.dart';
import 'package:pepelist/utils/projetcProvider.dart';

import 'package:pepelist/utils/responsiveLayout.dart';
import 'package:pepelist/widgets/navbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controllers = new ScrollController();
  @override
  void initState() {
    //Initialize the  scrollController
    super.initState();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectProvider(),
      child: MaterialApp(
          home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                controller: controllers,
                child: Column(
                  children: <Widget>[
                    Body(controller: controllers),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Body extends StatelessWidget {
  ScrollController controller;
  Body({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(controller: controller),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  ScrollController controller;
  LargeChild({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("images/lecturerhall.jpg"),
          )),
          height: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavBar(controller: controller),
              SizedBox(
                height: 800,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: 0.5,
                      child: Image.network("assets/images/logowhite.png",
                          scale: .6),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: .6,
                      child: Padding(
                        padding: EdgeInsets.only(left: 158),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  text: "Welcome To ",
                                  style: TextStyle(
                                      fontSize: 60, color: Colors.blue[700]),
                                  children: [
                                    TextSpan(
                                        text: "PEER UUM",
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[200]))
                                  ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                height: size.height / 18,
                                width: size.width / 12,
                                child: FlatButton(
                                  hoverColor: Colors.blue[900],
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  child: Text(
                                    "Lets Get Started",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Container(
              height: size.height / 1,
              width: size.width / 1.5,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "WHAT IS PEERUUM?",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                    ),
                  ),
                  Image(
                    image: NetworkImage("assets/images/peeruum.PNG", scale: 2),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        child: Text(
                          "PEERUUM web-based system is a platform for lecturers and teachers to customize the rubric and scales in the peer evaluation form on PEERUUM. Students can directly access to the website to evaluate their peer and submit the score to lecturers through the website. Lecturers no longer need to manually add the score because this system will save the score according to the class and group in database.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //Services
        Container(
          height: size.height / 1.3,
          color: Colors.grey[200],
          width: size.width,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
                  child: Text(
                    "SERVICES",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Course Service
                  Container(
                    height: size.height / 1.8,
                    width: size.width / 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            height: size.height / 6.5,
                            width: size.width / 6.5,
                            child: Image(
                              image: NetworkImage("assets/images/courses.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("MANAGE COURSES",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                  "PEERUUM allow you to create a course according to your subject and classes that you are currently teaching. This features let you easy to manage the peer evaluation form for your students.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //CUSTOMIZE peer evaluation form
                  Container(
                    height: size.height / 1.8,
                    width: size.width / 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            height: size.height / 6.5,
                            width: size.width / 6.5,
                            child: Image(
                              image: NetworkImage("assets/images/form.png",
                                  scale: 4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("CUSTOMIZE PEER EVALUATION FROM",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                  "PEERUUM provide you a customized peer evaluation features to customized the evaluation form and receive peer evaluation score from the student. This allow you to change the rubric from the form easily and more flexible compare to static form. ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Score panel
                  Container(
                    height: size.height / 1.8,
                    width: size.width / 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            height: size.height / 6.5,
                            width: size.width / 6.5,
                            child: Image(
                                image: NetworkImage("assets/images/score.png",
                                    scale: 4)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("SCORE PANEL",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                  "PEERUUM provide you a formular to calculate all the student score after the student finish their peer evaluation by using the peer evaluation form that you have created.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // About Us
        Container(
          height: size.height / 1.3,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0x20141E30), Color(0x20243B55)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "DEVELOPER OF PEER UUM",
                  style: TextStyle(color: Colors.grey, fontSize: 50),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //weijing
                  Expanded(
                    child: Container(
                      height: size.height / 2,
                      width: size.width / 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('images/weijing.png'),
                              radius: 125,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Yong Wei Jing",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "weijing980924@gmail.com",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Developer of PEER UUM",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Undergraduate Student In UUM",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 35,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 35,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //bottom bar
        Container(
          height: size.height / 10,
          width: size.width,
          color: Color(0xff152238),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "PEER UUM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(220, 4, 4, 4),
                    child: Text(
                      "Copyright © 2021, PEPECHU. All rights reserved.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 130, 4),
                child: Container(
                  height: size.height / 13,
                  child: Image(
                      image: NetworkImage(
                    "assets/images/logowhite.png",
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8591B0),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular"),
            ),
            RichText(
              text: TextSpan(
                text: 'Welcome To ',
                style: TextStyle(fontSize: 40, color: Color(0xFF8591B0)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'PEPeLIST',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black87)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 20),
              child: Text("LET’S EXPLORE THE WORLD"),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/images/student.png",
                scale: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
