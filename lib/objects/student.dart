class Student {
  String name;
  String email;
  String password;
  String telephone;
  String course;

  Student(String n, String em, String pass, String tele , String course) {
    this.name = n;
    this.email = em;
    this.password = pass;
    this.email = email;
    this.course=course;
    this.telephone=tele;

  }

  setCourses(String courses){
    this.course=courses;
  }
}
