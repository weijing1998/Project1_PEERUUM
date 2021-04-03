import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class StudentCoursesPage extends StatefulWidget {
  final Function toggleJoinCourse;
  final PeerUser user;

  const StudentCoursesPage({
    Key key,
    @required this.toggleJoinCourse,
    this.user,
  }) : super(key: key);

  @override
  StudentCoursesPageState createState() => StudentCoursesPageState();
}

class StudentCoursesPageState extends State<StudentCoursesPage> {
  Crudmethod crud;
  Future<List<Map<String, dynamic>>> list;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
    return StreamBuilder<List<Courses>>(
        stream: provider.courselist,
        builder: (context, snapshot) {
          return Container(
            height: size.height,
            width: size.width - size.width / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("WELCOME, " + widget.user.userName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      // TODO : REPLACE WITH SEARC BAR
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(85, 0, 0, 0),
                      child: Row(
                        children: [
                          Image.network(
                            "images/courses.png",
                            scale: 9,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "COURSES PAGE",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                SingleChildScrollView(
                  child: Container(
                      height: size.height / 1.42,
                      width: size.width / 1.3,
                      color: Colors.grey[300],
                      child: StreamBuilder<List<Courses>>(
                        stream: provider.courselist,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data.length < 1
                                ? Center(
                                    child: Text(
                                      "No Course Created",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  color: Colors.blue[300],
                                                  height: 50,
                                                  width: double.infinity,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: Text(
                                                        " COURSE NAME : " +
                                                            snapshot.data[index]
                                                                .courseName
                                                                .toUpperCase(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 150,
                                                  width: double.infinity,
                                                  color: Colors.blueGrey[50],
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: size.width / 1.9,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            //Course ID
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .article,
                                                                    size: 25,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    "COURSE CODE : " +
                                                                        snapshot
                                                                            .data[index]
                                                                            .courseCode,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            //Course Group
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.group,
                                                                    size: 25,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    "COURSE GROUP : " +
                                                                        snapshot
                                                                            .data[index]
                                                                            .courseGroup,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            // Course Batch
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    size: 25,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    "COURSE BATCH : " +
                                                                        snapshot
                                                                            .data[index]
                                                                            .courseBatch,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 25),
                                                        child: Container(
                                                          height: 40,
                                                          width:
                                                              size.width / 12,
                                                          child: MaterialButton(
                                                            color: Colors
                                                                .blue[900],
                                                            onPressed:
                                                                () async {
                                                              await provider
                                                                  .setCoursesId(snapshot
                                                                      .data[
                                                                          index]
                                                                      .courseID);
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder: (context) =>
                                                                      ChangeNotifierProvider(
                                                                          create: (context) =>
                                                                              ProjectProvider(),
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                new Text("Join Course"),
                                                                            content: new Text("You are joining " +
                                                                                snapshot.data[index].courseName +
                                                                                ", click ok to join"),
                                                                            actions: <Widget>[
                                                                              MaterialButton(
                                                                                child: Text('Cancel'),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    Navigator.of(context).pop();
                                                                                  });
                                                                                },
                                                                              ),
                                                                              MaterialButton(
                                                                                child: Text('Ok'),
                                                                                onPressed: () async {
                                                                                  await provider.addStudentToCourse(snapshot.data[index], widget.user) ;
                                                                                  widget.toggleJoinCourse(false);
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                              )
                                                                            ],
                                                                          )));
                                                            },
                                                            child: Text(
                                                              "Join Couses",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                          } else {
                            return Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  )),
                            );
                          }
                        },
                      )),
                ),
              ],
            ),
          );
        });
  }

  successAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Apply successfully"),
      content: Text('The form is applied successfully'),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  failAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Apply Fail"),
      content: Text('System detect duplicate form apply'),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
