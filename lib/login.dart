import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/register.dart';
import 'package:pepelist/sidebar.dart';

import 'package:pepelist/utils/constants.dart';
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
                    child: Container(
                      width: width - 500,
                      height: height - 160,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(
                                          'assets/images/logo.png',
                                          scale: 2,
                                        ),
                                      ),
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 42,
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
                                            IconButton(
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
                                              iconSize: 140,
                                              onPressed: () {
                                                setState(() {
                                                  typeOfUser = "Lecturer";
                                                });
                                              },
                                            ),
                                            IconButton(
                                              tooltip: "Student",
                                              icon: Image.asset(
                                                  'images/student.png'),
                                              iconSize: 140,
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
                                            TextFormField(
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
                                            SizedBox(height: 4),
                                            TextFormField(
                                              controller: passwordController,
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height / 9),
                                      Container(
                                        height: 48,
                                        width: width / 5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
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
                                                  fontSize: 17,
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
                                                      size: 24,
                                                    ),
                                            ],
                                          ),
                                          onTap: () async {
                                            setState(() {
                                              submitting = true;
                                            });
                                            await signIn(emailController.text,
                                                passwordController.text);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 80, 0, 0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text("Don't have an account?"),
                                                Container(
                                                  height: 20,
                                                  width: 70,
                                                  child: MaterialButton(
                                                      hoverColor:
                                                          Colors.transparent,
                                                      onPressed: () {
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  RegisterPage()),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Sign Up",
                                                        style: TextStyle(
                                                            color: Colors.blue),
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
                          size: 32,
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
                              TextStyle(color: Colors.grey[700], fontSize: 20),
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
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await firebaseStore.get().then((value) => value.docs.forEach((element) {
            if (element.data()["email"] == emailController.text &&
                element.data()["typeOfUser"] == typeOfUser) {
              identify = true;
            }
          }));
      if (identify == true && typeOfUser == "Lecturer") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Sidebar(
                    email: emailController.text,
                  )),
        );
      } else if (identify == true && typeOfUser == "Student") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          submitting = false;
        });
        showAlertDialogType(context);
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

  showAlertDialogPass(BuildContext _context) {
    // set up the button
    return showDialog(
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
