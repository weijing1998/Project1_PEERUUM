import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/group.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class JoinCourse extends StatefulWidget {
  final PeerUser user;
  final Function leavecourse;
  JoinCourse({
    Key key,
    @required this.user,
    @required this.leavecourse,
  }) : super(key: key);

  @override
  _JoinCourseState createState() => _JoinCourseState();
}

class _JoinCourseState extends State<JoinCourse> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    var provider = Provider.of<ProjectProvider>(context);
    return StreamBuilder<Courses>(
        stream: provider.streamCourse,
        builder: (context, snapshotCourse) {
          if (snapshotCourse.hasData) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(150, 20, 0, 20),
                          child: Text(
                            "COURSE DETAIL",
                            style: TextStyle(
                                fontSize: total * 2,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 20),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                provider.leaveCourses(
                                    snapshotCourse.data, widget.user);
                                    widget.leavecourse(true);
                           
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue[200],
                                      Colors.blue[600]
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: width * 0.09,
                                    maxHeight: height * 0.05),
                                alignment: Alignment.center,
                                child: Text(
                                  "Leave Course",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Edit Button
                      ],
                    ),
                    //Course detail
                    Container(
                      height: size.height / 3,
                      width: size.width / 1.5,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.blue[300].withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ], color: Colors.grey[200]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE NAME : " + snapshotCourse.data.courseName,
                              style: TextStyle(
                                  fontSize: total * 1.2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE CODE : " + snapshotCourse.data.courseCode,
                              style: TextStyle(
                                  fontSize: total * 1.2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE GROUP : " +
                                  snapshotCourse.data.courseGroup,
                              style: TextStyle(
                                  fontSize: total * 1.2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE BATCH : " +
                                  snapshotCourse.data.courseBatch,
                              style: TextStyle(
                                  fontSize: total * 1.2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  "FORM STATUS : ",
                                  style: TextStyle(
                                      fontSize: total * 1.2,
                                      fontWeight: FontWeight.w600),
                                ),
                                snapshotCourse.data.listOfForm.length == 0
                                    ? Container(
                                        height: size.height / 20,
                                        width: size.width / 15,
                                        decoration: BoxDecoration(
                                            color: Colors.red[700],
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey[300])),
                                        child: Align(
                                          child: Text(
                                            "No Form Apply",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: total * 0.9,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      )
                                    : SingleChildScrollView(
                                        child: Container(
                                          height: size.height / 20,
                                          width: size.width / 2,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snapshotCourse
                                                  .data.listOfForm.length,
                                              itemBuilder: (BuildContext ctxt,
                                                  int index) {
                                                return Card(
                                                  child: Container(
                                                    height: size.height / 20,
                                                    width: size.width / 15,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.green[400],
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors
                                                                .grey[600])),
                                                    child: Align(
                                                      child: Text(
                                                        snapshotCourse.data
                                                                .listOfForm[
                                                            index]["formname"],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: total * 0.9,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                              ],
                            ),
                          ),
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
                              style: TextStyle(
                                  fontSize: total * 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SingleChildScrollView(
                      child: Container(
                        height: size.height / 1.45,
                        width: size.width / 1.5,
                        color: Colors.grey[300],
                        child: snapshotCourse.data.listOfGroup.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshotCourse.data.listOfGroup.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        height: height * 0.6,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.yellow[100],
                                              Colors.blue[200],
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: height * 0.06,
                                              width: double.infinity,
                                              //important
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    "Group Name : " +
                                                        snapshotCourse
                                                            .data
                                                            .listOfGroup[index]
                                                                ["groupname"]
                                                            .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: total * 1.5,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: size.width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Text(
                                                      "STUDENT INFO IN " +
                                                          snapshotCourse
                                                              .data
                                                              .listOfGroup[
                                                                  index]
                                                                  ["groupname"]
                                                              .toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: total * 1.25,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              List
                                                                  listofstudent =
                                                                  snapshotCourse
                                                                          .data
                                                                          .listOfGroup[index]
                                                                      [
                                                                      "listofstudent"];

                                                              if (listofstudent
                                                                  .any((element) =>
                                                                      element[
                                                                          'email'] ==
                                                                      widget
                                                                          .user
                                                                          .email)) {
                                                                joinedGroupAlert(
                                                                    context);
                                                              } else {
                                                                listofstudent
                                                                    .add(widget
                                                                        .user
                                                                        .toJson());

                                                                provider.addStudentToGroup(
                                                                    snapshotCourse
                                                                        .data,
                                                                    listofstudent,
                                                                    index);

                                                                successJoinGroupAlert(
                                                                    context);
                                                              }
                                                            });
                                                          },
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80.0)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          child: Ink(
                                                            decoration:
                                                                BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Colors.blue[
                                                                            200],
                                                                        Colors.blue[
                                                                            600]
                                                                      ],
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                      end: Alignment
                                                                          .centerRight,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0)),
                                                            child: Container(
                                                              constraints: BoxConstraints(
                                                                  maxWidth:
                                                                      width *
                                                                          0.09,
                                                                  maxHeight:
                                                                      height *
                                                                          0.05),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Join Group",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              List
                                                                  listofstudent =
                                                                  snapshotCourse
                                                                          .data
                                                                          .listOfGroup[index]
                                                                      [
                                                                      "listofstudent"];

                                                              listofstudent.removeWhere(
                                                                  (element) =>
                                                                      element[
                                                                          'email'] ==
                                                                      widget
                                                                          .user
                                                                          .email);
                                                              provider.deleteStudentFromGroup(
                                                                  snapshotCourse
                                                                      .data,
                                                                  listofstudent,
                                                                  index);
                                                              successLeaveGroupAlert(
                                                                      context)(
                                                                  context);
                                                            });
                                                          },
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80.0)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          child: Ink(
                                                            decoration:
                                                                BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Colors.blue[
                                                                            200],
                                                                        Colors.blue[
                                                                            600]
                                                                      ],
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                      end: Alignment
                                                                          .centerRight,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0)),
                                                            child: Container(
                                                              constraints: BoxConstraints(
                                                                  maxWidth:
                                                                      width *
                                                                          0.09,
                                                                  maxHeight:
                                                                      height *
                                                                          0.05),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Leave Group",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  height: size.height / 2.6,
                                                  width: size.width / 1.9,
                                                  color: Colors.transparent,
                                                  child: snapshotCourse
                                                              .data
                                                              .listOfGroup[
                                                                  index][
                                                                  "listofstudent"]
                                                              .length !=
                                                          0
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: snapshotCourse
                                                              .data
                                                              .listOfGroup[
                                                                  index][
                                                                  "listofstudent"]
                                                              .length,
                                                          itemBuilder: (context,
                                                              indexOfStudent) {
                                                            return InkWell(
                                                              hoverColor:
                                                                  Colors.grey,
                                                              splashColor:
                                                                  Colors.blue,
                                                              focusColor:
                                                                  Colors.red,
                                                              onTap: () {
                                                                setState(() {
                                                                  bool
                                                                      checkjoinedgroup =
                                                                      false;

                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          snapshotCourse
                                                                              .data
                                                                              .listOfGroup[index]["listofstudent"]
                                                                              .length;
                                                                      i++) {
                                                                    if (snapshotCourse.data.listOfGroup[index]["listofstudent"][i]
                                                                            [
                                                                            "email"] ==
                                                                        widget
                                                                            .user
                                                                            .email) {
                                                                      checkjoinedgroup =
                                                                          true;
                                                                    }
                                                                  }

                                                                  if (checkjoinedgroup ==
                                                                      true) {
                                                                    if (snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent]
                                                                            [
                                                                            "email"] ==
                                                                        widget
                                                                            .user
                                                                            .email) {
                                                                      selfEvaluateAlert(
                                                                          context);
                                                                    } else {
                                                                      showDialog(
                                                                        barrierDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                ChangeNotifierProvider(
                                                                          create: (context) =>
                                                                              ProjectProvider(),
                                                                          child:
                                                                              StudentChooseForm(
                                                                            currentUser:
                                                                                widget.user,
                                                                            course:
                                                                                snapshotCourse.data,
                                                                            evaluateUser:
                                                                                PeerUser.fromJson(
                                                                              snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent],
                                                                            ),
                                                                            group:
                                                                                Group.fromJson(snapshotCourse.data.listOfGroup[index]),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    joinGroupAlert(
                                                                        context);
                                                                  }
                                                                });
                                                              },
                                                              child: Card(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  width: width *
                                                                      0.18,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundImage:
                                                                              NetworkImage('assets/images/header.jpg'),
                                                                          radius:
                                                                              total * 3,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "Name : " +
                                                                            snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent]['name'],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                total * 1),
                                                                      ),
                                                                      Text(
                                                                          "Matric : " +
                                                                              snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent][
                                                                                  'matric'],
                                                                          style:
                                                                              TextStyle(fontSize: total * 1)),
                                                                      Text(
                                                                          "Email : " +
                                                                              snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent][
                                                                                  "email"],
                                                                          style:
                                                                              TextStyle(fontSize: total * 1)),
                                                                      Text(
                                                                          snapshotCourse.data.listOfGroup[index]["listofstudent"][indexOfStudent]
                                                                              [
                                                                              "typeOfUser"],
                                                                          style:
                                                                              TextStyle(fontSize: total * 1)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                      : Center(
                                                          child: Text(
                                                              "No Students",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      total *
                                                                          1)),
                                                        ),
                                                ),
                                              ),
                                            ),
                                            snapshotCourse
                                                        .data
                                                        .listOfGroup[index]
                                                            ["listofstudent"]
                                                        .length >
                                                    0
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .arrowCircleLeft,
                                                          size: total * 0.8,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "Swipe left to see more",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    total *
                                                                        0.8)),
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: Text("No Group Created"),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 4,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          }
        });
  }

  successLeaveCourseAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("Leave course successfully"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            setState(() {
              
              Navigator.of(context).pop();
            });
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  successLeaveGroupAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("Leave Group successfully"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  joinGroupAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("You need to join the group to start the evaluation"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  successJoinGroupAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("Join Group successfully"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  joinedGroupAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("You already joined the group"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  selfEvaluateAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("You cannot evaluate yourself"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
