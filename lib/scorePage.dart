import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatefulWidget {
  final Function toggleViewScore;
  final PeerUser user;

  const ScorePage({
    Key key,
    @required this.toggleViewScore,
    this.user,
  }) : super(key: key);

  @override
  ScorePageState createState() => ScorePageState();
}

class ScorePageState extends State<ScorePage> {
  Future<List<Map<String, dynamic>>> list;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
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
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // TODO : REPLACE WITH SEARC BAR
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.04,
                              child: Image.network(
                                "assets/images/score.png",
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "SCORE PAGE",
                              style: TextStyle(
                                  fontSize: total * 2,
                                  fontWeight: FontWeight.w700),
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
                                          fontSize: total * 1.3,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return snapshot.data[index].ownerid ==
                                              widget.user.userid
                                          ? Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  height: height * 0.25,
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        color: Colors.teal[400],
                                                        height: height * 0.05,
                                                        width: double.infinity,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Text(
                                                              " COURSE NAME : " +
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .courseName
                                                                      .toUpperCase(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      total *
                                                                          1.4),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height * 0.2,
                                                        width: double.infinity,
                                                        color:
                                                            Colors.blueGrey[50],
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  size.width /
                                                                      1.9,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  //Course ID
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .article,
                                                                          size: total *
                                                                              1.3,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE CODE : " +
                                                                              snapshot.data[index].courseCode,
                                                                          style: TextStyle(
                                                                              fontSize: total * 1.1,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  //Course Group
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .group,
                                                                          size: total *
                                                                              1.3,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE GROUP : " +
                                                                              snapshot.data[index].courseGroup,
                                                                          style: TextStyle(
                                                                              fontSize: total * 1.1,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // Course Batch
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .calendar_today,
                                                                          size: total *
                                                                              1.3,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE BATCH : " +
                                                                              snapshot.data[index].courseBatch,
                                                                          style: TextStyle(
                                                                              fontSize: total * 1.1,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40.0,
                                                              margin: EdgeInsets
                                                                  .all(15),
                                                              child:
                                                                  MaterialButton(
                                                                onPressed:
                                                                    () async {
                                                                  await provider
                                                                      .setCoursesId(snapshot
                                                                          .data[
                                                                              index]
                                                                          .courseID);
                                                                  widget
                                                                      .toggleViewScore(
                                                                          true);
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            80.0)),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Ink(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Colors.teal[400],
                                                                              Colors.teal[800]
                                                                            ],
                                                                            begin:
                                                                                Alignment.centerLeft,
                                                                            end:
                                                                                Alignment.centerRight,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0)),
                                                                  child:
                                                                      Container(
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
                                                                      "View Score",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              total * 1.1),
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
                                            )
                                          : SizedBox();
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
