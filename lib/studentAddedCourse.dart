import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudFirebase.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class StudentAddedCoursesPage extends StatefulWidget {
  final Function toggleJoinCourse;
  final PeerUser user;
  final List<Courses> courselist;

  const StudentAddedCoursesPage({
    Key key,
    @required this.toggleJoinCourse,
    @required this.user,
    @required this.courselist,
  }) : super(key: key);

  @override
  StudentAddedCoursesPageState createState() => StudentAddedCoursesPageState();
}

class StudentAddedCoursesPageState extends State<StudentAddedCoursesPage> {
  Crudmethod crud;
  List<Courses> courselists = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.courselist.length; i++) {
      for (int j = 0; j < widget.courselist[i].listOfStudent.length; j++) {
        if (widget.courselist[i].listOfStudent[j]["email"] ==
            widget.user.email) {
          courselists.add(widget.courselist[i]);
        }
      }
    }
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
                              "ADDED COURSES PAGE",
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
                            return courselists.length == 0
                                ? Center(
                                    child: Text(
                                      "No Course Added",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: courselists.length,
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
                                                            courselists[index]
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
                                                                        courselists[index]
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
                                                                        courselists[index]
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
                                                                        courselists[index]
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
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80.0)),
                                                            onPressed: () {
                                                              setState(() {
                                                                provider.setCoursesId(
                                                                    courselists[
                                                                            index]
                                                                        .courseID);
                                                                widget
                                                                    .toggleJoinCourse(
                                                                        true);
                                                              });
                                                            },
                                                            child: Ink(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Colors
                                                                              .blue[200],
                                                                          Colors
                                                                              .blue[600]
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
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxWidth:
                                                                            130.0,
                                                                        minHeight:
                                                                            40.0),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "View Course",
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
                                                      ),
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
}
