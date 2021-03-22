import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pepelist/objects/course.dart';

class Crudmethod {
  //get user login
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  //Add user
  Future<void> addUser(userData) async {
    if (isLogin()) {
      FirebaseFirestore.instance
          .collection("User")
          .add(userData)
          .catchError((e) {
        print(e);
      });
    } else {
      print("you need to login");
    }
  }

  //Get Courses
  Stream<List<Courses>> getCourses() {
    return db
        .collection("Courses")
        .snapshots()
        .map((event) => event.docs.map((e) => Courses.fromJson(e.data())).toList());
  }

  //Update Courses
  Future setCourses(Courses courses) async {
    return db.collection("Courses").doc(courses.courseID).set(courses.toJson());
  }


  //delete
  Future deleteCourses(String coursesId) async {
    return db.collection("Courses").doc(coursesId).delete();
  }
}
