import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/login.dart';
import 'package:pepelist/register.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controllers = new ScrollController();
  @override
  void initState() {
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
          theme: ThemeData(fontFamily: "Inconsolata"),
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
  final ScrollController controller;
  Body({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("assets/images/lecturerhall.jpg"),
          )),
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavBar(controller: controller),
              SizedBox(
                height: height*0.8,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: 0.5,
                      child: Container(
                        height: height * 7,
                        width: width * 3,
                        child: Image.network(
                          "assets/images/logowhite.png",
                        ),
                      ),
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
                                      fontSize: total * 4,
                                      color: Colors.blue[700]),
                                  children: [
                                    TextSpan(
                                        text: "PEER UUM",
                                        style: TextStyle(
                                            fontSize: total * 4,
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
                                child: MaterialButton(
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
                                        fontSize: total * 0.9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
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
                          fontSize: total * 4,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    height: height * 0.5,
                    child: Image(
                      image: NetworkImage(
                        "assets/images/peeruum.PNG",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        child: Text(
                          "PEERUUM web-based system is a platform for lecturers and teachers to customize the rubric and scales in the peer evaluation form on PEERUUM. Students can directly access to the website to evaluate their peer and submit the score to lecturers through the website. Lecturers no longer need to manually add the score because this system will save the score according to the class and group in database.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: total * 1.5,
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
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                  child: Text(
                    "SERVICES",
                    style: TextStyle(
                        fontSize: total * 4,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Course Service
                    Container(
                      height: size.height / 1.8,
                      width: size.width / 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              height: height * 0.13,
                              width: width * 0.13,
                              child: Image(
                                image:
                                    NetworkImage("assets/images/courses.png"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text("MANAGE COURSES",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: total * 2.3,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                child: Text(
                                    "PEERUUM allow you to create a course according to your subject and classes that you are currently teaching. This features let you easy to manage the peer evaluation form for your students.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: total * 1.4,
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
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: height * 0.13,
                              width: width * 0.13,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                image: NetworkImage(
                                  "assets/images/form.png",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text("CUSTOMIZE PEER EVALUATION FROM",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: total * 2,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                child: Text(
                                    "PEERUUM provide you a customized peer evaluation features to customized the evaluation form and receive peer evaluation score from the student. This allow you to change the rubric from the form easily and more flexible compare to static form. ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: total * 1.4,
                                      height: 1.2,
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
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              height: height * 0.13,
                              width: width * 0.13,
                              child: Image(
                                  image: NetworkImage(
                                "assets/images/score.png",
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text("SCORE PANEL",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: total * 2.3,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                child: Text(
                                    "PEERUUM provide you a formular to calculate all the student score after the student finish their peer evaluation by using the peer evaluation form that you have created.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: total * 1.4,
                                      height: 1.2,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  style: TextStyle(color: Colors.grey, fontSize: total * 4),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //weijing
                  Container(
                    height: size.height / 1.8,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage('assets/images/weijing.png'),
                            radius: total * 7,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Yong Wei Jing",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: total * 1.8,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "weijing980924@gmail.com",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: total * 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Developer of PEER UUM",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: total * 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Undergraduate Student In UUM",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: total * 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.github,
                                  size: total * 2.3,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  size: total * 2.3,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  size: total * 2.3,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "PEER UUM",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: total * 1.3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Text(
                        "Copyright © 2021, PEERUUM. All rights reserved.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: total * 1.3,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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

class NavBar extends StatefulWidget {
  final ScrollController controller;

  NavBar({Key key, this.controller}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "PEER UUM",
                style: TextStyle(
                    fontSize: total * 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Container(
            width: width / 2,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  height: 60,
                  minWidth: 100,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "HOME",
                    style: TextStyle(
                        fontSize: total * 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                MaterialButton(
                  height: 60,
                  minWidth: 100,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "ABOUT",
                    style: TextStyle(
                        fontSize: total * 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    widget.controller.animateTo(3600,
                        duration: Duration(milliseconds: 2000),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                ),
                MaterialButton(
                  height: 60,
                  minWidth: 100,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: total * 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                MaterialButton(
                  height: height * 0.06,
                  minWidth: width * 0.09,
                  color: Colors.blue[900],
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
