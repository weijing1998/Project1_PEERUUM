class PeerUser {
  String userName;
  String email;
  String password;
  String typeOfUser;
  String matric;
  String userid;

  PeerUser(
      {this.userName,
      this.email,
      this.password,
      this.typeOfUser,
      this.matric,
      this.userid});

  factory PeerUser.fromJson(Map<String, dynamic> json) {
    return PeerUser(
      userName: json["name"],
      email: json["email"],
      typeOfUser: json["typeOfUser"],
      matric: json['matric'],
      userid: json['userid']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "typeOfUser": typeOfUser,
      "name": userName,
      'matric': matric,
      'userid' : userid
    };
  }
}
