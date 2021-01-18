import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/utils/crudWidget.dart';

class CoursesPage extends StatefulWidget {
  final Function toggleViewCourse;
  final Function passCourse;
  final Function setCurrentIndex;
  final Data data;
  final Function refresh;

  const CoursesPage({
    Key key,
    @required this.toggleViewCourse,
    @required this.passCourse,
    @required this.setCurrentIndex,
    @required this.data,@required this.refresh,
  }) : super(key: key);

  @override
  CoursesPageState createState() => CoursesPageState();
}

class CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width - size.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("WELCOME" + " WEIJING,",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                // TODO : REPLACE WITH SEARC BAR
                SizedBox(
                  width: size.width / 2.5,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: FlatButton(
                    color: Colors.blue[900],
                    focusColor: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddCourseDialog(
                          data: widget.data,
                          reset: refreshpage,
                        ),
                      );
                    },
                    child: Text(
                      "Add Courses",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 0, 10, 0),
                child: Image.network(
                  "images/courses.png",
                  scale: 9,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "COURSES PAGE",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                child: ListView.builder(
                  itemCount: widget.data.courses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.blue[300],
                                height: 50,
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      " COURSE NAME : " +
                                          widget.data.courses[index].courseName
                                              .toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
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
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Course ID
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.article,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "COURSE ID : " +
                                                    widget.data.courses[index]
                                                        .courseID,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        //Course Group
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
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
                                                    widget.data.courses[index]
                                                        .courseGroup,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        // Course Batch
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "COURSE BATCH : " +
                                                    widget.data.courses[index]
                                                        .courseBatch,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width / 2.2,
                                    ),
                                    Container(
                                      height: 40,
                                      width: size.width / 10,
                                      child: FlatButton(
                                        color: Colors.blue[900],
                                        onPressed: () {
                                          widget.toggleViewCourse(true);
                                          widget.passCourse(
                                              widget.data.courses[index]);
                                          widget.setCurrentIndex(index);
                                          widget.refresh();
                                        },
                                        child: Text(
                                          "View Couses",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
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
                  },
                )),
          )
        ],
      ),
    );
  }

  void refreshpage() {
    setState(() {});
  }
}
