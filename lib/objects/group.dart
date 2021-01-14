import 'package:pepelist/objects/student.dart';

class Group {
  List<Student> groupStudent;
  String groupName;
  String groupID;

  Group(String gn, String gID) {
    this.groupName = gn;
    this.groupID = gID;
  }
}
