class Group {
  String groupName;
  String groupID;
  List listofStudent;

  Group({this.groupName, this.groupID, this.listofStudent});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupName: json["groupname"],
      groupID: json['groupid'],
      listofStudent: json['listofstudent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "groupname": groupName,
      "groupid": groupID,
      "listofstudent": listofStudent,
    };
  }
}
