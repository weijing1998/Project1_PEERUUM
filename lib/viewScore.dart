import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
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
                        height: size.height / 1.45,
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
                                        height: 600,
                                        width: double.infinity,
                                        color: Colors.brown[200],
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

  void resetViewPage() {
    setState(() {});
  }
}
