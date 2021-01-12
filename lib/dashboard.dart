import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/widgets/sidebar.dart';

class Dashboard extends StatefulWidget {
  final String email;
  final String name;

  Dashboard({@required this.email, @required this.name});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool atManager = true;
  Data data = new Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Sidebar(),
    ));
  }
}
