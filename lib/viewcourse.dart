import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pepelist/dashboard.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/widgets/sidebar.dart';

class ViewCourse extends StatefulWidget {
  final Courses course;
  final int viewCourseIndex;
  final Data data;

  ViewCourse(
      {Key key,
      @required this.course,
      @required this.viewCourseIndex,
      @required this.data})
      : super(key: key);

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
                      "COURSE DETAIL",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.7,
                ),
                Container(
                  child: Row(
                    children: [
                      //Edit Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {},
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

                      // Delete Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.data.courses
                                    .remove(widget.viewCourseIndex);
                                print(Data().courses.length);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              });
                            },
                            child: Text(
                              "Delete Course",
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
            //course detail
            Container(
              height: size.height / 3,
              width: size.width / 1.5,
              color: Colors.red,
            ),
            SizedBox(
              height: size.height / 18,
            ),

            //Group detail
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      child: Text(
                        "SMALL GROUP",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              child: Container(
                height: size.height / 2,
                width: size.width / 1.5,
                color: Colors.red,
                child: ListView.builder(
                    itemCount: widget.course.listOfGroup.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.green,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
