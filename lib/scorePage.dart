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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(
                              "images/score.png",
                              scale: 9,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "SCORE PAGE",
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
                                      return snapshot.data[index].ownerid ==
                                              widget.user.userid
                                          ? Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  height: 200,
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        color: Colors.teal[400],
                                                        height: 50,
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
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 150,
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
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE CODE : " +
                                                                              snapshot.data[index].courseCode,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
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
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE GROUP : " +
                                                                              snapshot.data[index].courseGroup,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
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
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "COURSE BATCH : " +
                                                                              snapshot.data[index].courseBatch,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
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
                                                                            150.0,
                                                                        minHeight:
                                                                            40.0),
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
                                                                              12),
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
