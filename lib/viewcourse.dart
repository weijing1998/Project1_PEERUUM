import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class ViewCourse extends StatefulWidget {
  ViewCourse({
    Key key,
  }) : super(key: key);

  @override
  _ViewCourseState createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 145, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            ChangeNotifierProvider(
                                          create: (context) =>
                                              ProjectProvider(),
                                          child: EditCourseDialog(
                                            courses: snapshotCourse.data,
                                            resetViewPage: resetViewPage,
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue[400],
                                            Colors.blue[800]
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 130.0, minHeight: 40.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Edit Course",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              snapshotCourse.data.listOfForm.length == 0
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) =>
                                                  ChangeNotifierProvider(
                                                create: (context) =>
                                                    ProjectProvider(),
                                                child: DeleteFormFromCourse(
                                                  course: snapshotCourse.data,
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.blue[400],
                                                  Colors.blue[800]
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 130.0,
                                                minHeight: 40.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Delete Form",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        //Edit Button
                      ],
                    ),
                    //Course detail
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: size.height / 3,
                        width: size.width / 1.5,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.blue[200].withOpacity(0.5),
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
                                "COURSE NAME : " +
                                    snapshotCourse.data.courseName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "COURSE CODE : " +
                                    snapshotCourse.data.courseCode,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "COURSE GROUP : " +
                                    snapshotCourse.data.courseGroup,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "COURSE BATCH : " +
                                    snapshotCourse.data.courseBatch,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
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
                                                  width: 1.5,
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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                              width: 1.5,
                                                              color: Colors
                                                                  .grey[600])),
                                                      child: Align(
                                                        child: Text(
                                                          snapshotCourse.data
                                                                  .listOfForm[
                                                              index]["formname"],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
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
                    ),
                    SizedBox(
                      height: size.height / 18,
                    ),

                    //Group detail
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
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
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: MaterialButton(
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) =>
                                              ChangeNotifierProvider(
                                                create: (context) =>
                                                    ProjectProvider(),
                                                child: AddGroupDialog(
                                                  course: snapshotCourse.data,
                                                ),
                                              ));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue[400],
                                              Colors.blue[800]
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 130.0, minHeight: 40.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Add Group",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Edit Group Button
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MaterialButton(
                                    onPressed: snapshotCourse
                                                .data.listOfGroup.length !=
                                            0
                                        ? () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    ChangeNotifierProvider(
                                                      create: (context) =>
                                                          ProjectProvider(),
                                                      child: EditGroupDialog(
                                                        course:
                                                            snapshotCourse.data,
                                                      ),
                                                    ));
                                          }
                                        : () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue[400],
                                              Colors.blue[800]
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 130.0, minHeight: 40.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Edit Group",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Delete Group Button
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MaterialButton(
                                    onPressed: snapshotCourse
                                                .data.listOfGroup.length !=
                                            0
                                        ? () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    ChangeNotifierProvider(
                                                      create: (context) =>
                                                          ProjectProvider(),
                                                      child: DeleteGroupDialog(
                                                        course:
                                                            snapshotCourse.data,
                                                      ),
                                                    ));
                                          }
                                        : () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue[400],
                                              Colors.blue[800]
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 130.0, minHeight: 40.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Delete Group",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      child: Container(
                        height: size.height / 1.45,
                        width: size.width / 1.5,
                        color: Colors.grey[300],
                        child: snapshotCourse.data.listOfGroup.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshotCourse.data.listOfGroup.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue[50],
                                              Colors.blue[100],
                                              Colors.blue[200],
                                              Colors.blue[400]
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                          ),
                                        ),
                                        height: 600,
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 8),
                                              child: Container(
                                                height: 60,
                                                width: double.infinity,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Group Name: " +
                                                        snapshotCourse
                                                            .data
                                                            .listOfGroup[index]
                                                                ["groupname"]
                                                            .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      18, 0, 18, 18),
                                              child: Text(
                                                "Student information in " +
                                                    snapshotCourse
                                                        .data
                                                        .listOfGroup[index]
                                                            ["groupname"]
                                                        .toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
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
                                                  child: snapshotCourse
                                                              .data
                                                              .listOfGroup[
                                                                  index][
                                                                  "listofstudent"]
                                                              .length !=
                                                          0
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: snapshotCourse
                                                              .data
                                                              .listOfGroup[
                                                                  index][
                                                                  "listofstudent"]
                                                              .length,
                                                          itemBuilder: (context,
                                                              indexOfStudent) {
                                                            return Card(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100],
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10)),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.2),
                                                                      spreadRadius:
                                                                          3,
                                                                      blurRadius:
                                                                          7,
                                                                      offset: Offset(
                                                                          0,
                                                                          1), // changes position of shadow
                                                                    ),
                                                                  ],
                                                                ),
                                                                height: double
                                                                    .infinity,
                                                                width: 330,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage('images/header.jpg'),
                                                                        radius:
                                                                            52,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "Name : " +
                                                                          snapshotCourse
                                                                              .data
                                                                              .listOfGroup[index]["listofstudent"][indexOfStudent]['name'],
                                                                    ),
                                                                    Text(
                                                                      "Matric : " +
                                                                          snapshotCourse
                                                                              .data
                                                                              .listOfGroup[index]["listofstudent"][indexOfStudent]["matric"],
                                                                    ),
                                                                    Text(
                                                                      "Email : " +
                                                                          snapshotCourse
                                                                              .data
                                                                              .listOfGroup[index]["listofstudent"][indexOfStudent]["email"],
                                                                    ),
                                                                    Text(
                                                                      snapshotCourse
                                                                          .data
                                                                          .listOfGroup[index]["listofstudent"][indexOfStudent]["typeOfUser"],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                      : Center(
                                                          child: Text(
                                                              "No Students"),
                                                        ),
                                                ),
                                              ),
                                            ),
                                            snapshotCourse
                                                        .data
                                                        .listOfGroup[index]
                                                            ["listofstudent"]
                                                        .length >
                                                    3
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            "Swipe Left to see more "),
                                                        Icon(
                                                          Icons.arrow_right_alt,
                                                          color:
                                                              Colors.grey[600],
                                                          size: 32,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox()
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
