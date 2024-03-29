import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class ViewScore extends StatefulWidget {
  ViewScore({
    Key key,
  }) : super(key: key);

  @override
  _ViewScoreState createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {
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
                          padding: const EdgeInsets.fromLTRB(160, 20, 0, 20),
                          child: Text(
                            "COURSE DETAIL",
                            style: TextStyle(
                                fontSize: total * 2,
                                fontWeight: FontWeight.bold),
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
                          color: Colors.green[400].withOpacity(0.5),
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
                                  fontSize: total * 1.3,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE CODE : " + snapshotCourse.data.courseCode,
                              style: TextStyle(
                                  fontSize: total * 1.3,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE GROUP : " +
                                  snapshotCourse.data.courseGroup,
                              style: TextStyle(
                                  fontSize: total * 1.3,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE BATCH : " +
                                  snapshotCourse.data.courseBatch,
                              style: TextStyle(
                                  fontSize: total * 1.3,
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
                                      fontSize: total * 1.3,
                                      fontWeight: FontWeight.w600),
                                ),
                                snapshotCourse.data.listOfForm.length == 0
                                    ? Container(
                                        height: size.height / 20,
                                        width: size.width / 15,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              stops: [0.1, 0.5, 0.7, 0.9],
                                              colors: [
                                                Colors.red[600],
                                                Colors.red[500],
                                                Colors.red[400],
                                                Colors.red[300],
                                              ],
                                            ),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey[600])),
                                        child: Align(
                                          child: Text(
                                            "No Form Apply",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: total * 1.1,
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
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft,
                                                          stops: [
                                                            0.1,
                                                            0.5,
                                                            0.7,
                                                            0.9
                                                          ],
                                                          colors: [
                                                            Colors.green[600],
                                                            Colors.green[500],
                                                            Colors.green[400],
                                                            Colors.green[300],
                                                          ],
                                                        ),
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
                                                            fontSize:
                                                                total * 1.1,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 10, 10, 20),
                      child: Align(
                        child: Text(
                          "STUDENT PERFORMANCE & COMMENTS",
                          style: TextStyle(
                              fontSize: total * 2, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    //List of Form

                    SingleChildScrollView(
                      child: Container(
                        height: size.height / 1.35,
                        width: size.width / 1.5,
                        color: Colors.grey[300],
                        child: snapshotCourse.data.listOfForm.length != 0 &&
                                snapshotCourse.data.listOfScore.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshotCourse.data.listOfForm.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.teal[300],
                                              Colors.blue[300],
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Text(
                                                  "Form Name : " +
                                                      snapshotCourse.data
                                                              .listOfForm[index]
                                                          ["formname"],
                                                  style: TextStyle(
                                                      fontSize: total * 1.1,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: size.height / 1.7,
                                              width: double.infinity,
                                              child: ScoreWidget(
                                                listofscore: snapshotCourse
                                                    .data.listOfScore,
                                                form: Forms.fromJson(
                                                    snapshotCourse.data
                                                        .listOfForm[index]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Container(
                                    height: size.height / 5,
                                    width: size.width / 3,
                                    child: Center(
                                      child: Text(
                                        "No Form Applied or No Student Submit Any Evaluation",
                                        style: TextStyle(
                                            fontSize: total * 1.1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ))),
                      ),
                    ),

                    SizedBox(
                      height: size.height / 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 10, 10, 20),
                      child: Align(
                        child: Text(
                          "STUDENT TOTAL SCORE",
                          style: TextStyle(
                              fontSize: total * 2, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    SingleChildScrollView(
                      child: Container(
                        height: size.height / 1.35,
                        width: size.width / 1.5,
                        color: Colors.grey[300],
                        child: snapshotCourse.data.listOfForm.length != 0 &&
                                snapshotCourse.data.listOfScore.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshotCourse.data.listOfForm.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.yellow[100],
                                              Colors.teal[300],
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Text(
                                                  "Form Name : " +
                                                      snapshotCourse.data
                                                              .listOfForm[index]
                                                          ["formname"],
                                                  style: TextStyle(
                                                      fontSize: total * 1.1,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: size.height / 1.7,
                                              width: double.infinity,
                                              child: TotalScoreWidget(
                                                listofscore: snapshotCourse
                                                    .data.listOfScore,
                                                forms: Forms.fromJson(
                                                    snapshotCourse.data
                                                        .listOfForm[index]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Container(
                                    height: size.height / 5,
                                    width: size.width / 3,
                                    child: Center(
                                      child: Text(
                                        "No Form Applied or No Student Submit Any Evaluation",
                                        style: TextStyle(
                                            fontSize: total * 1.1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ))),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
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
}

class ScoreWidget extends StatefulWidget {
  final List listofscore;
  final Forms form;
  ScoreWidget({Key key, @required this.listofscore, @required this.form})
      : super(key: key);

  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  List update;
  @override
  // void initState() {
  //   update = widget.listofscore;
  //   for (int i = 0; i < widget.listofscore.length; i++) {
  //     if (widget.listofscore[i]["formid"] == widget.form.formID) {
  //       update.add(widget.listofscore[i]);
  //     }
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    return ListView.builder(
      itemCount: widget.listofscore.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: widget.listofscore[index]["formid"] == widget.form.formID
              ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: size.height / 6,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width / 25,
                        ),
                        Container(
                          width: size.width / 2.4,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('assets/images/header.jpg'),
                                  radius: total * 2.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Name :" +
                                              widget.listofscore[index]
                                                  ["evaluateusername"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: total * 0.9),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Email :" +
                                              widget.listofscore[index]
                                                  ["evaluateuseremail"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: total * 0.9),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Matric No :" +
                                              widget.listofscore[index]
                                                  ["evaluateusermatric"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: total * 0.9),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Group :" +
                                              widget.listofscore[index]
                                                  ["groupname"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: total * 0.9),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Student point :" +
                                            widget.listofscore[index]
                                                    ["studentpoint"]
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: total * 0.9),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Total point :" +
                                            widget.listofscore[index]
                                                    ["totalpoint"]
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: total * 0.9),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Rate By :" +
                                            widget.listofscore[index]
                                                ["currentuser"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: total * 0.9),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  calculatepercentage(
                                              widget.listofscore[index]
                                                  ["studentpoint"],
                                              widget.listofscore[index]
                                                  ["totalpoint"])
                                          .toStringAsFixed(2) +
                                      "%",
                                  style: TextStyle(
                                    fontSize: total * 1.6,
                                    color: Colors.blue,
                                    fontFamily: "Dela Gothic One",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            widget.listofscore[index]["questionNanswer"].length !=
                                    0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          studentComment(
                                              context,
                                              widget.listofscore[index]
                                                  ['questionNanswer']);
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.comment,
                                            size: total * 1.4,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Comment',
                                            style: TextStyle(
                                                fontSize: total * 1.3,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  ),
              )
              : SizedBox.shrink(),
        );
      },
    );
  }

  double calculatepercentage(int studentpoint, int totalpoint) {
    double percentage = (studentpoint / totalpoint) * 100;
    String parse = percentage.toStringAsFixed(2);
    double afterparse = double.parse(parse);
    return afterparse;
  }

  studentComment(BuildContext context, List questionNanswer) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    Size size = MediaQuery.of(context).size;
    var alert = AlertDialog(
      title: Text("Student Comment"),
      content: SingleChildScrollView(
        child: Container(
          width: size.width / 2,
          height: size.height / 2,
          child: ListView.builder(
              itemCount: questionNanswer.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Text(
                              "Question " +
                                  (index + 1).toString() +
                                  " : " +
                                  questionNanswer[index]["questions"],
                              style: TextStyle(fontSize: total * 1.1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Text(
                                "Answer: " + questionNanswer[index]["answer"]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: size.width / 17,
            height: size.height / 20,
            color: Colors.teal,
            child: MaterialButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
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

class TotalScoreWidget extends StatefulWidget {
  final List listofscore;
  final Forms forms;

  TotalScoreWidget({Key key, @required this.listofscore, @required this.forms})
      : super(key: key);

  @override
  _TotalScoreWidgetState createState() => _TotalScoreWidgetState();
}

class _TotalScoreWidgetState extends State<TotalScoreWidget> {
  List sameForm = [];
  List totalscorewithduplicate = [];
  List totalscore = [];
  @override
  void initState() {
    for (int i = 0; i < widget.listofscore.length; i++) {
      if (widget.listofscore[i]["formid"] == widget.forms.formID) {
        sameForm.add(widget.listofscore[i]);
      }
    }

    for (int i = 0; i < sameForm.length; i++) {
      int totalstudentpoint = 0;
      int divide = 0;

      for (int j = 0; j < sameForm.length; j++) {
        if (sameForm[i]["evaluateuseremail"] ==
            sameForm[j]["evaluateuseremail"]) {
          totalstudentpoint = totalstudentpoint + sameForm[j]["studentpoint"];
          divide = divide + 1;
        }
      }

      Map map = {
        "email": sameForm[i]["evaluateuseremail"],
        "name": sameForm[i]["evaluateusername"],
        "matric": sameForm[i]["evaluateusermatric"],
        "totalstudentpoint": totalstudentpoint / divide,
        "totalpoint": sameForm[i]["totalpoint"],
        "group": sameForm[i]["groupname"]
      };
      totalscorewithduplicate.add(map);
    }

    final jsonList =
        totalscorewithduplicate.map((item) => jsonEncode(item)).toList();
    final uniqueJsonList = jsonList.toSet().toList();
    final result = uniqueJsonList.map((item) => jsonDecode(item)).toList();
    totalscore = result;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    return ListView.builder(
      itemCount: totalscore.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: Colors.white54,
              height: size.height / 6,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 25,
                  ),
                  Container(
                    width: size.width / 2.3,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage('assets/images/header.jpg'),
                            radius: total * 2.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Name :" + totalscore[index]["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Email :" + totalscore[index]["email"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Matric :" + totalscore[index]["matric"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Group :" + totalscore[index]["group"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Total Student point :" +
                                      totalscore[index]["totalstudentpoint"]
                                          .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Total point :" +
                                      totalscore[index]["totalpoint"]
                                          .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: total * 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        calculatepercentage(
                                    totalscore[index]["totalstudentpoint"],
                                    totalscore[index]["totalpoint"])
                                .toStringAsFixed(2) +
                            "%",
                        style: TextStyle(
                          fontSize: total * 1.6,
                          color: Colors.blue,
                          fontFamily: "Dela Gothic One",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  double calculatepercentage(double studentpoint, int totalpoint) {
    double percentage = (studentpoint / totalpoint) * 100;
    String parse = percentage.toStringAsFixed(2);
    double afterparse = double.parse(parse);
    return afterparse;
  }
}
