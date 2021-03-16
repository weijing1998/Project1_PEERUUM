import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/data.dart';
import 'package:pepelist/utils/crudWidget.dart';

class ViewCourse extends StatefulWidget {
  final Courses course;
  final int viewCourseIndex;
  final Data data;

  ViewCourse({
    Key key,
    @required this.course,
    @required this.viewCourseIndex,
    @required this.data,
  }) : super(key: key);

  @override
  _ViewCourseState createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                //Edit Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 180, 20),
                  child: Container(
                    height: 40,
                    width: 120,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) => EditCourseDialog(
                              course: widget.course,
                              resetViewPage: reset,
                            ),
                          );
                        });
                      },
                      child: Text(
                        "Edit Course",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
            //Course detail
            Container(
              height: size.height / 3,
              width: size.width / 1.5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE NAME : " + widget.course.courseName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE ID : " + widget.course.courseID,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE GROUP : " + widget.course.courseGroup,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "COURSE BATCH : " + widget.course.courseBatch,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "FORM STATUS : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        widget.course.listOfForm.length == 0
                            ? Container(
                                height: size.height / 20,
                                width: size.width / 15,
                                decoration: BoxDecoration(
                                    color: Colors.red[700],
                                    border: Border.all(
                                        width: 3, color: Colors.grey[600])),
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
                                      itemCount:
                                          widget.course.listOfForm.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return Card(
                                          child: Container(
                                            height: size.height / 20,
                                            width: size.width / 15,
                                            decoration: BoxDecoration(
                                                color: Colors.green[400],
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.grey[600])),
                                            child: Align(
                                              child: Text(
                                                widget.course.listOfForm[index]
                                                    .formName,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w200),
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
                  )
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 3.2,
                ),
                Container(
                  child: Row(
                    children: [
                      //ADD Group Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddGroupDialog(
                                    course: widget.course,
                                    resetViewPage: reset,
                                  ),
                                );
                              });
                            },
                            child: Text(
                              "Add Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),

                      // Edit Group Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: widget.course.listOfGroup.length != 0
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => EditGroupDialog(
                                        course: widget.course,
                                        resetViewPage: reset,
                                      ),
                                    );
                                  }
                                : () {},
                            child: Text(
                              "Edit Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                      //Delete Group Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: widget.course.listOfGroup.length != 0
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteGroupDialog(
                                        course: widget.course,
                                        resetViewPage: reset,
                                      ),
                                    );
                                  }
                                : () {},
                            child: Text(
                              "Delete Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SingleChildScrollView(
              child: Container(
                height: size.height / 1.45,
                width: size.width / 1.5,
                color: Colors.grey[300],
                child: widget.course.listOfGroup.length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.course.listOfGroup.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                height: 600,
                                width: double.infinity,
                                color: Colors.blueGrey[500],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: double.infinity,
                                      color: Colors.blueGrey[800],
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          widget.course.listOfGroup[index]
                                              .groupName
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        "GROUP ID : " +
                                            widget.course.listOfGroup[index]
                                                .groupID,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        "STUDENT INFO IN " +
                                            widget.course.listOfGroup[index]
                                                .groupName
                                                .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: size.height / 2.6,
                                          width: size.width / 1.9,
                                          color: Colors.transparent,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: widget
                                                  .course
                                                  .listOfGroup[index]
                                                  .groupStudent
                                                  .length,
                                              itemBuilder:
                                                  (context, indexOfStudent) {
                                                return Card(
                                                  child: Container(
                                                    color: Colors.teal[200],
                                                    height: double.infinity,
                                                    width: 330,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    'images/header.jpg'),
                                                            radius: 52,
                                                          ),
                                                        ),
                                                        Text(
                                                          "NAME : " +
                                                              widget
                                                                  .course
                                                                  .listOfGroup[
                                                                      index]
                                                                  .groupStudent[
                                                                      indexOfStudent]
                                                                  .name,
                                                        ),
                                                        Text(
                                                          "Email : " +
                                                              widget
                                                                  .course
                                                                  .listOfGroup[
                                                                      index]
                                                                  .groupStudent[
                                                                      indexOfStudent]
                                                                  .email,
                                                        ),
                                                        Text(
                                                          "Course : " +
                                                              widget
                                                                  .course
                                                                  .listOfGroup[
                                                                      index]
                                                                  .groupStudent[
                                                                      indexOfStudent]
                                                                  .course,
                                                        ),
                                                        Text(
                                                          "Telephone No : " +
                                                              widget
                                                                  .course
                                                                  .listOfGroup[
                                                                      index]
                                                                  .groupStudent[
                                                                      indexOfStudent]
                                                                  .telephone,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ),
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
  }

  void reset() {
    setState(() {});
  }
}
