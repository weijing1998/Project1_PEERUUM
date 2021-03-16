class Lecturer {
  String name;
  String email;
  String password;
  String telephone;

  Lecturer(String n, String em, String pass, String tele) {
    this.name = n;
    this.email = em;
    this.password = pass;
    this.telephone=tele;
  }

  Map<String , dynamic > toMap(){
    return {
      'name':name,
      'email':email,
      'password':password,
      'telephone':telephone
    };
  }
}
