import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/homePage.dart';
import 'package:pepelist/login.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/constants.dart';
import 'package:pepelist/utils/crudFirebase.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double width;
  double height;
  double total;
  bool submitting = false;
  String typeOfUser = "Student";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController typeOfUserController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStore = FirebaseFirestore.instance;
  final highlightcolor = Colors.grey;

  Crudmethod crud = new Crudmethod();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    total = (width + height) / 2 / 100;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                width: width * 0.7,
                height: height * 0.85,
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
                                      "assets/images/registerpic.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 72, vertical: 56),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: total * 2,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height / 100 * 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      tooltip: "Lecturer",
                                      highlightColor: highlightcolor,
                                      icon: Image.asset('images/lecturer.png'),
                                      iconSize: total * 10,
                                      onPressed: () {
                                        setState(() {
                                          typeOfUser = "Lecturer";
                                        });
                                      },
                                    ),
                                    IconButton(
                                      tooltip: "Student",
                                      icon: Image.asset('images/student.png'),
                                      iconSize: total * 10,
                                      onPressed: () {
                                        setState(() {
                                          typeOfUser = "Student";
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                Form(
                                  key: _formKey,
                                  child: typeOfUser == "Student"
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller: nameController,
                                                  decoration: InputDecoration(
                                                      hintText: 'Full Name',
                                                      hintStyle: TextStyle()),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Invalid Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Email Address',
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Invalid Email';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller: matricController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Matric Number',
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Empty Matric';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
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
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller:
                                                      confirmPasswordController,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Confirm Password',
                                                  ),
                                                  validator: (value) {
                                                    if (value !=
                                                            passwordController
                                                                .text ||
                                                        value.isEmpty) {
                                                      return 'Incorrect Password';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller: nameController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Full Name',
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
                                            ),
                                            SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Email Address',
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Invalid Email';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
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
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller:
                                                      confirmPasswordController,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Confirm Password',
                                                  ),
                                                  validator: (value) {
                                                    if (value !=
                                                            passwordController
                                                                .text ||
                                                        value.isEmpty) {
                                                      return 'Incorrect Password';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                height: height * 0.045,
                                                child: TextFormField(
                                                  controller:
                                                      typeOfUserController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Refer Key',
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty ||
                                                        value != "Lecturer") {
                                                      return 'Need Refer Key';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                SizedBox(height: height * 0.045),
                                Container(
                                  height: height * 0.055,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    mouseCursor: submitting
                                        ? null
                                        : MaterialStateMouseCursor.clickable,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          submitting ? 'Submitting' : 'Sign Up',
                                          style: TextStyle(
                                            fontSize: total * 1.2,
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
                                                size: total * 1.7,
                                              ),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        submitting = true;
                                      });
                                      if (_formKey.currentState.validate()) {
                                        signup(
                                            emailController.text,
                                            passwordController.text,
                                            nameController.text);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(fontSize: total * 1),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.04,
                                        child: MaterialButton(
                                            hoverColor: Colors.transparent,
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                              );
                                            },
                                            child: Text(
                                              "Log In",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: total * 1),
                                            )),
                                      ),
                                    ],
                                  )),
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
                    size: total * 2.4,
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
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: total * 1.7,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  signup(String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      PeerUser datas = PeerUser(
          email: emailController.text,
          matric: matricController.text,
          typeOfUser: typeOfUser,
          userName: nameController.text,
          userid: firebaseAuth.currentUser.uid);

      await crud.setUser(datas);

      await userCredential.user.sendEmailVerification();

      setState(() {
        submitting = false;
      });
      await showAlertDialogSuccess(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          submitting = false;
        });
        showAlertDialogPass(context);
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          showAlertDialogEmail(context);
          submitting = false;
        });
      }
    } catch (e) {}
  }

  showAlertDialogEmail(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Register Unsuccesful"),
            content: Text("This email already registered."),
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
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Register Unsuccesful"),
            content: Text("The password is too weak."),
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

  showAlertDialogSuccess(BuildContext _context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Register Succesful"),
            content: Text(
                "The email verification has been sent, Welcome to Peer UUM"),
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
