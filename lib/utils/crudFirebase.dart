import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
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
Future setUser(PeerUser user) async {
    return db.collection("User").doc(user.userid).set(user.toJson());
  }
  

  //Get User
  Stream<List<PeerUser>> getUser() {
    return db.collection("User").snapshots().map(
        (event) => event.docs.map((e) => PeerUser.fromJson(e.data())).toList());
  }

  /////////////////////////////////////////////(User)

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
  ////////////////////////////////////////////(Course)

  //////////////////////////////////////////////(Form)

  Stream<List<Forms>> getFormsList() {
    return db.collection("Form").snapshots().map(
        (event) => event.docs.map((e) => Forms.fromJson(e.data())).toList());
  }

  Stream<Forms> getForms(String formsid) {
    return db
        .collection("Form")
        .doc(formsid)
        .snapshots()
        .map((event) => Forms.fromJson(event.data()));
  }

  Future setForms(Forms forms) async {
    return db.collection("Form").doc(forms.formID).set(forms.toJson());
  }

  //delete
  Future deleteForms(String formId) async {
    return db.collection("Form").doc(formId).delete();
  }

  //////////////////////////////////////////////(Form)

  //////////////////////////////////////////////(Group)

  Stream<List<Group>> getGroupList() {
    return db.collection("Group").snapshots().map(
        (event) => event.docs.map((e) => Group.fromJson(e.data())).toList());
  }

  Stream<Group> getGroups(String groupid) {
    return db
        .collection("Group")
        .doc(groupid)
        .snapshots()
        .map((event) => Group.fromJson(event.data()));
  }

  //add
  Future setGroup(Group groups) async {
    return db.collection("Group").doc(groups.groupID).set(groups.toJson());
  }

  //delete
  Future deleteGroup(String groupId) async {
    return db.collection("Group").doc(groupId).delete();
  }

  Stream<List<Map<String, dynamic>>> getListOfRubric() {
    return db
        .collection("Form")
        .where("listofrubric",
            isEqualTo: "a7ab8d20-8fe6-11eb-ae87-c51269295350")
        .snapshots()
        .map((QuerySnapshot snapshot) =>
            snapshot.docs.map((DocumentSnapshot doc) => doc.data()).toList());
  }

  //////////////////////////////////////////////(Group)
}
