import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';

class ViewCourse extends StatefulWidget {
  final Courses course;

  ViewCourse({Key key, @required this.course}) : super(key: key);

  @override
  _ViewCourseState createState() => _ViewCourseState();
}

class _ViewCourseState extends State<ViewCourse> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.amber[200]),
      padding: EdgeInsets.all(32),
      height: size.height,
      width: size.width - size.width / 6,
      child: Row(
        children: [Text("${widget.course.courseName}")],
      ),
    );
  }
}
