import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/utils/crudWidget.dart';
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
                          "STUDENT PERFORMANCE",
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
                        child: snapshotCourse.data.listOfForm.length != 0
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
                                        color: Colors.brown[200],
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                snapshotCourse
                                                        .data.listOfForm[index]
                                                    ["formname"],
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: size.height / 1.7,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.blueAccent)),
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
                            : Text("No Form Applied"),
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
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  height: size.height / 6,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('images/header.jpg'),
                          radius: 30,
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
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Name :" +
                                    widget.listofscore[index]
                                        ["evaluateusername"],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Email :" +
                                    widget.listofscore[index]
                                        ["evaluateuseremail"],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Group :" +
                                    widget.listofscore[index]["groupname"],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Rate By :" +
                                    widget.listofscore[index]["currentuser"],
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
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Student point :" +
                                    widget.listofscore[index]["studentpoint"]
                                        .toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Total point :" +
                                    widget.listofscore[index]["totalpoint"]
                                        .toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(calculatepercentage(
                                  widget.listofscore[index]["studentpoint"],
                                  widget.listofscore[index]["totalpoint"])
                              .toString() +
                          "%"),
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
   String parse= percentage.toStringAsFixed(2);
   double afterparse=double.parse(parse);
    return afterparse;
  }
}
