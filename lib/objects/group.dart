import 'package:pepelist/objects/student.dart';

class Group {
  List<Student> groupStudent;
  String groupName;
  String groupID;

  Group(String gn, String gID) {
    this.groupName = gn;
    this.groupID = gID;

    groupStudent = [
      Student("YONG", "YONG@gmail.com", "12323", "0127762335","IT"),
      Student("Likey", "YONG@gmail.com", "12323", "0127762335","IT"),
      Student("Waynn", "YONG@gmail.com", "12323", "0127762335","IT"),
      Student("Waynn", "YONG@gmail.com", "12323", "0127762335","IT"),
      Student("Wesley", "YONG@gmail.com", "12323", "0127762335","IT"),
    ];
  }
}
