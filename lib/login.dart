import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/register.dart';
import 'package:pepelist/sidebar.dart';
import 'package:pepelist/studentSidebar.dart';

import 'package:pepelist/utils/constants.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final String email;
  final String password;

  LoginPage({this.email, this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PeerUser peeruser;
  double width;
  double height;
  bool submitting = false;
  bool identify = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String typeOfUser = "Student";
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStore = FirebaseFirestore.instance.collection("User");
  List<PeerUser> peeruserlist;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    var provider = Provider.of<ProjectProvider>(context);

    return StreamBuilder<List<PeerUser>>(
        stream: provider.userlist,
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent[100],
                        kOrange0,
                        Colors.grey[400],
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: height * 0.85, maxWidth: width * 0.7),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [kItemCardShadow],
                          color: Colors.grey[100],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "assets/images/loginpic.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 72, vertical: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(
                                            'assets/images/logo.png',
                                            height: (height + width) / 25,
                                            width: (height + width) / 25,
                                          ),
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: total * 2,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: IconButton(
                                                  focusColor: Colors.yellow,
                                                  splashColor: Colors.yellow,
                                                  padding: EdgeInsets.all(10),
                                                  tooltip: "Lecturer",
                                                  highlightColor: Colors.red,
                                                  hoverColor: Colors.red,
                                                  color: Colors.blue,
                                                  icon: Image.asset(
                                                    'images/lecturer.png',
                                                  ),
                                                  iconSize:
                                                      (height + width) / 25,
                                                  onPressed: () {
                                                    setState(() {
                                                      typeOfUser = "Lecturer";
                                                    });
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                tooltip: "Student",
                                                icon: Image.asset(
                                                    'images/student.png'),
                                                iconSize: (height + width) / 25,
                                                onPressed: () {
                                                  setState(() {
                                                    typeOfUser = "Student";
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.05,
                                                child: TextFormField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Email Address',
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Invalid Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Container(
                                                height: height * 0.05,
                                                child: TextFormField(
                                                  controller:
                                                      passwordController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Password',
                                                  ),
                                                  obscureText: true,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Invalid Password';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: height * 0.06),
                                        Container(
                                          height: height * 0.05,
                                          width: width / 6,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[900],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: InkWell(
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            mouseCursor: submitting
                                                ? null
                                                : MaterialStateMouseCursor
                                                    .clickable,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  submitting
                                                      ? 'Logging in'
                                                      : 'Login',
                                                  style: TextStyle(
                                                    fontSize: total*1.2,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 24),
                                                submitting
                                                    ? kSpinKitLoader
                                                    : FaIcon(
                                                        FontAwesomeIcons
                                                            .solidArrowAltCircleRight,
                                                        color: Colors.white,
                                                        size: total*1.7,
                                                      ),
                                              ],
                                            ),
                                            onTap: () async {
                                              setState(() {
                                                submitting = true;
                                              });
                                              // Navigator.pushReplacement(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         Sidebar(
                                              //       users: PeerUser(
                                              //           userName: 'asd',
                                              //           email: "asd",
                                              //           typeOfUser: "Student",
                                              //           matric: '261505'),
                                              //     ),
                                              //   ),
                                              // );

                                              await signIn(emailController.text,
                                                  passwordController.text);
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 0, 0),
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      "Don't have an account?",
                                                      style: TextStyle(
                                                          fontSize:
                                                              total * 1.2),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: height * 0.03,
                                                    width: width * 0.05,
                                                    child: MaterialButton(
                                                        hoverColor:
                                                            Colors.transparent,
                                                        onPressed: () {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        RegisterPage()),
                                                          );
                                                        },
                                                        child: Text(
                                                          "Sign Up",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize:
                                                                  total * 1.2),
                                                        )),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.03,
                                                    width: width * 0.15,
                                                    child: MaterialButton(
                                                        hoverColor:
                                                            Colors.transparent,
                                                        onPressed: () {
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  ChangeUserPassword());
                                                        },
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Forgot Password?",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize:
                                                                    total *
                                                                        1.2),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 26,
                  child: Row(
                    children: [
                      InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        child: FaIcon(
                          FontAwesomeIcons.arrowAltCircleLeft,
                          color: kGrey4,
                          size: total*2.4,
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Main Page",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: total * 1.7 , fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  signIn(String email, String password) async {
    PeerUser user;

    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      if (userCredential.user.emailVerified == true) {
        await firebaseStore.get().then((value) => value.docs.forEach((element) {
              if (element.data()["email"] == emailController.text &&
                  element.data()["typeOfUser"] == typeOfUser) {
                identify = true;
                user = PeerUser.fromJson(element.data());
              }
            }));
        if (identify == true && typeOfUser == "Lecturer") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Sidebar(
                      users: user,
                    )),
          );
        } else if (identify == true && typeOfUser == "Student") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StudentPage(users: user),
            ),
          );
        } else {
          setState(() {
            submitting = false;
          });
          showAlertDialogType(context);
        }
      } else {
        showAlertDialogVerify(context);
        setState(() {
          submitting = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          submitting = false;
        });
        showAlertDialogEmail(context);
        print('user not found.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          submitting = false;
        });
        showAlertDialogPass(context);
        print('wrong password.');
      }
    } catch (e) {
      print(e);
    }
  }

  showAlertDialogEmail(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign In Unsuccesful"),
            content: Text("This email is not registered."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          );
        });
  }

  showAlertDialogVerify(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign In Unsuccesful"),
            content: Text("This email is not verify yet."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          );
        });
  }

  showAlertDialogPass(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign In Unsuccesful"),
            content: Text("The password is incorrect"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          );
        });
  }

  showAlertDialogType(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign In Unsuccesful"),
            content: Text("Incorrect Type Of User"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          );
        });
  }
}
