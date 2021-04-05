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
                          padding: const EdgeInsets.fromLTRB(150, 20, 0, 20),
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 20, 20),
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        showDialog(
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
                              snapshotCourse.data.listOfForm.length == 0
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 20, 20),
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        child: MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              showDialog(
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
                                          child: Text(
                                            "Delete Form",
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
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  child: MaterialButton(
                                    onPressed: () {
                                      showDialog(
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
                                  child: MaterialButton(
                                    onPressed: snapshotCourse
                                                .data.listOfGroup.length !=
                                            0
                                        ? () {
                                            showDialog(
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
                                    child: Text(
                                      "Edit Group",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    // color: Colors.blue[900],
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
                                  child: MaterialButton(
                                    onPressed: snapshotCourse
                                                .data.listOfGroup.length !=
                                            0
                                        ? () {
                                            showDialog(
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
                                        height: 600,
                                        width: double.infinity,
                                        color: Colors.blueGrey[500],
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: double.infinity,
                                              color: Colors.blueGrey[800],
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  snapshotCourse
                                                      .data
                                                      .listOfGroup[index]
                                                          ["groupname"]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text(
                                                "STUDENT INFO IN " +
                                                    snapshotCourse
                                                        .data
                                                        .listOfGroup[index]
                                                            ["groupname"]
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
                                                                color: Colors
                                                                    .teal[200],
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
                                                                      "NAME : " +
                                                                          snapshotCourse
                                                                              .data
                                                                              .listOfGroup[index]["listofstudent"][indexOfStudent]['name'],
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
