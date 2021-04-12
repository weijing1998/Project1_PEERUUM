class PeerUser {
  String userName;
  String email;
  String password;
  String typeOfUser;
  String matric;

  PeerUser({this.userName, this.email, this.password, this.typeOfUser,this.matric});

  factory PeerUser.fromJson(Map<String, dynamic> json) {
    return PeerUser(
      userName: json["name"],
      email: json["email"],
      typeOfUser: json["typeOfUser"],
      matric: json['matric'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "typeOfUser": typeOfUser,
      "name": userName,
      'matric': matric,
    };
  }
}
