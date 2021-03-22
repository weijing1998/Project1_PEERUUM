class User {
  String userName;
  String email;
  String password;
  String typeOfUser;

  User({this.userName, this.email, this.password, this.typeOfUser});

  Map<String, dynamic> toMap() {
    return {
      'name': userName,
      'email': email,
      'password': password,
      'typeofuser' : typeOfUser,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json["coursename"],
      email: json["courseid"],
      typeOfUser: json["coursebatch"],
    );
  }
}
