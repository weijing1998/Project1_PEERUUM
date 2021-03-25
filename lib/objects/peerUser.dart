class PeerUser {
  String userName;
  String email;
  String password;
  String typeOfUser;

  PeerUser({this.userName, this.email, this.password, this.typeOfUser});

  Map<String, dynamic> toMap() {
    return {
      'name': userName,
      'email': email,
      'password': password,
      'typeofuser': typeOfUser,
    };
  }

  factory PeerUser.fromJson(Map<String, dynamic> json) {
    return PeerUser(
      userName: json["name"],
      email: json["email"],
      typeOfUser: json["typeofuser"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "typeOfUser": typeOfUser, "name": userName};
  }
}
