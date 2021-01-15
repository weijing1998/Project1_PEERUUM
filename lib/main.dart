import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pepelist/sidebar.dart';

import 'package:pepelist/utils/my_flutter_app_icons.dart';
import 'widgets/navbar.dart';
import 'utils/responsiveLayout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'PEERUUM',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.ubuntuTextTheme(),
    ),
    home: Sidebar(),
  ));
}

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
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
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
      ),
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
                      child: Image.network("assets/images/logo.png", scale: .6),
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
                                      fontSize: 60, color: Colors.white70),
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
                              child: Text(
                                "LET’S EXPLORE THIS SITE",
                                style: TextStyle(color: Colors.white),
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
              height: size.height,
              width: size.width / 1.5,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "WHAT IS PEPELIST?",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                    ),
                  ),
                  // Change to PEER UUM page
                  // Image(
                  //   image: NetworkImage("assets/images/pepelist.png", scale: 2),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Container(
                      child: Text(
                        "PEPELIST are a series of extremely useful resources to improve your productivity and organise your life. PEPELIST gives you more than just a to-do list,lanner & calendar app for managing and organizing your daily tasks, reminders, checklists, calendar events, grocery lists, a place to write long notes, create organised outlines and track your daily routines. You can organize tasks by time period, including daily, weekly, monthly, long-term activities. This web app displays every activity through the dashboard so that every activity can be viewed and managed easily.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
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
                  //todo Service
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
                              image: NetworkImage("assets/images/todolist.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("TODOLIST",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                                "PEPELIST allows you to prioritize the tasks that are more important. This means you don’t waste time on tasks that don’t require your immediate attention. Your list will help you stay focused on the tasks that are the most important and provide a planner for managing and organizing your daily tasks such as checklists, grocery lists and more.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Calander
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
                              image: NetworkImage("assets/images/calendar.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("CALENDER WIDGET",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                                "Calender widget keep your to-do list always at hand with our calendar widget. PEPELIST provide you a widget that contain to-do list and a planner that support yearly calendar view, agenda view, with built-in reminders. So that you can review and organize your calendar events and to do list side by side.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Performace panel
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
                                image: NetworkImage(
                                    "assets/images/performance.png")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Performance Panel",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                                "PEPELIST provided performance panel for you to view the total tasks, completed tasks , overdue tasks, and upcoming tasks after you have created your todo list. This give a overall view for you to observe youself all the time in just one panel with all type of graph.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                )),
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
        Container(
          height: size.height / 1.1,
          width: size.width,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "USER FEEDBACK",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 5,
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 5,
                            width: size.width / 5,
                            child: Image(
                              image: NetworkImage("assets/images/wesley.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wesley Ho",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Student of University Utara Malaysia",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  " ' PEPELIST let me to mark off the tasks that I have completed. At the end of the day, when I look at the list, it will give myself a sense of accomplishment and satisfaction. It might also have the effect of waking me up if nothing has been marked completed. Most important PEPELIST is FREE. ' ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18, height: 1.5),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  " ' Feeling forgetful? Nobody is capable of remembering everything at all times. PEPELIST are a useful external memory aid that give me the permission to forget my tasks. As long as I can remember to look at my to-do list, I will never lose anything that I have recorded on it. ' ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18, height: 1.5),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 5,
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 5,
                            width: size.width / 5,
                            child: Image(
                              image: NetworkImage("assets/images/likey.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Likey Goh",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Dental Technician in KLIDC",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // About Us
        Container(
          height: size.height / 1.5,
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
                  "MEET THE TEAM",
                  style: TextStyle(color: Colors.grey, fontSize: 50),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // waynn
                  Container(
                    height: size.height / 2,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('images/waynn.jpg'),
                            radius: 125,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Toh Wu Waynn",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "waynnt98@gmail.com",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Founder of PEPELIST",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.github,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //weijing
                  Container(
                    height: size.height / 2,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('images/weijing.png'),
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
                            "Founder of PEPELIST",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.github,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //emily
                  Container(
                    height: size.height / 2,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('images/emily.jpg'),
                            radius: 125,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Emily Siew Ke Hui",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "emilysiew98@gmail.com",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Founder of PEPELIST",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.github,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //eva

                  Container(
                    height: size.height / 2,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('images/eva.jpg'),
                            radius: 125,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Eva Ong Sin Nee",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "evaong14@gmail.com ",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Founder of PEPELIST",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.github,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                              ),
                              FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                              ),
                            ],
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
          color: Colors.grey[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "PEPELIST",
                      style: TextStyle(
                          color: Colors.grey[400],
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
                padding: EdgeInsets.only(right: 100),
                child: Container(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 30, 4),
                      child: Container(
                        height: size.height / 13,
                        child: Image(
                            image: NetworkImage(
                          "assets/images/logo.png",
                        )),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          MyFlutterApp.github_circled_alt2,
                          color: Colors.white60,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(
                          MyFlutterApp.facebook_circled,
                          color: Colors.white60,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(
                          MyFlutterApp.instagram_circled,
                          color: Colors.white60,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ]),
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
