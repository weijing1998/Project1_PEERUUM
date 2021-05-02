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
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),

                        //Edit Button
                      ],
                    ),
                    //Course detail
                    Container(
                      height: size.height / 3,
                      width: size.width / 1.5,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 2),
                          color: Colors.grey[300]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE NAME : " + snapshotCourse.data.courseName,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE CODE : " + snapshotCourse.data.courseCode,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE GROUP : " +
                                  snapshotCourse.data.courseGroup,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "COURSE BATCH : " +
                                  snapshotCourse.data.courseBatch,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  "FORM STATUS : ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                snapshotCourse.data.listOfForm.length == 0
                                    ? Container(
                                        height: size.height / 20,
                                        width: size.width / 15,
                                        decoration: BoxDecoration(
                                            color: Colors.red[700],
                                            border: Border.all(
                                                width: 3,
                                                color: Colors.grey[600])),
                                        child: Align(
                                          child: Text(
                                            "No Form Apply",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
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
                                                            width: 3,
                                                            color: Colors
                                                                .grey[600])),
                                                    child: Align(
                                                      child: Text(
                                                        snapshotCourse.data
                                                                .listOfForm[
                                                            index]["formname"],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
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
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    //List of Form

                    SingleChildScrollView(
                      child: Container(
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
                                        color: Colors.teal[200],
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.teal[600],
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
                                                      fontSize: 23,
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
                                            fontSize: 20,
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
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    SingleChildScrollView(
                      child: Container(
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
                                        color: Colors.teal[200],
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.teal[600],
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
                                                      fontSize: 23,
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
                                            fontSize: 20,
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: widget.listofscore.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: widget.listofscore[index]["formid"] == widget.form.formID
              ? Container(
                  color: Colors.white54,
                  height: size.height / 6,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width / 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('images/header.jpg'),
                          radius: 45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
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
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Email :" +
                                    widget.listofscore[index]
                                        ["evaluateuseremail"],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Matric No :" +
                                    widget.listofscore[index]
                                        ["evaluateusermatric"],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Group :" +
                                    widget.listofscore[index]["groupname"],
                                style: TextStyle(fontWeight: FontWeight.w500),
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
                                "Student point :" +
                                    widget.listofscore[index]["studentpoint"]
                                        .toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Total point :" +
                                    widget.listofscore[index]["totalpoint"]
                                        .toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Rate By :" +
                                    widget.listofscore[index]["currentuser"],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width / 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            calculatepercentage(
                                        widget.listofscore[index]
                                            ["studentpoint"],
                                        widget.listofscore[index]["totalpoint"])
                                    .toString() +
                                "%",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: "Dela Gothic One",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 13,
                      ),
                      widget.listofscore[index]["questionNanswer"].length != 0
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Comment',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              : Container(),
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
    Size size = MediaQuery.of(context).size;
    var alert = AlertDialog(
      title: Text("Student Comment"),
      content: SingleChildScrollView(
              child: Container(
          width: size.width / 3,
          height: size.height / 3,
          child: ListView.builder(
              itemCount: questionNanswer.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Text("Question " +
                                (index + 1).toString() +
                                " : " +
                                questionNanswer[index]["questions"]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child:
                                Text("Answer: " + questionNanswer[index]["answer"]),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('images/header.jpg'),
                      radius: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Name :" + totalscore[index]["name"],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Email :" + totalscore[index]["email"],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Matric :" + totalscore[index]["matric"],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Group :" + totalscore[index]["group"],
                            style: TextStyle(fontWeight: FontWeight.w500),
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
                                    .toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Total point :" +
                                totalscore[index]["totalpoint"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width / 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        calculatepercentage(
                                    totalscore[index]["totalstudentpoint"],
                                    totalscore[index]["totalpoint"])
                                .toString() +
                            "%",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontFamily: "Dela Gothic One",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 13,
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
