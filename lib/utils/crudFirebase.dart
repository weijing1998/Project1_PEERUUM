import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pepelist/objects/peerUser.dart';
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

/////////////////////////////////////////////(User)
  //Add user
  Future<void> addUser(userData) async {
    db.collection("User").add(userData).catchError((e) {
      print(e);
    });
  }

  //Get User
  Stream<List<PeerUser>> getUser() {
    return db.collection("User").snapshots().map(
        (event) => event.docs.map((e) => PeerUser.fromJson(e.data())).toList());
  }

///////////////////////////////////////////////

////////////////////////////////////////////(Course)
  //Get Courses
  Stream<List<Courses>> getCoursesList() {
    return db.collection("Courses").snapshots().map(
        (event) => event.docs.map((e) => Courses.fromJson(e.data())).toList());
  }

  Stream<Courses> getCourse(String courseid) {
    return db
        .collection("Courses")
        .doc(courseid)
        .snapshots()
        .map((event) => Courses.fromJson(event.data()));
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
///////////////////////////////////////////////
