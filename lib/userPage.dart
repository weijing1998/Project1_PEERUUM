import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  final PeerUser user;

  UserPage({Key key, @required this.user}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

final firebaseAuth = FirebaseAuth.instance;

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
    return Container(
      height: size.height,
      width: size.width - size.width / 6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 2,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('images/userwall.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: size.height / 3.5,
                    ),
                  ),
                  Align(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage('images/header.jpg'),
                          radius: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.user.userName,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.user.email,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        widget.user.typeOfUser == "Student"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.user.matric,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : SizedBox(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Type of User :" + widget.user.typeOfUser,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height / 12,
                width: size.width / 2.2,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blue[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Name : " + widget.user.userName,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                            create: (context) =>
                                                ProjectProvider(),
                                            child: EditUserName(
                                              user: widget.user,
                                            ),
                                          ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height / 12,
                width: size.width / 2.2,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blue[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: IconButton(
                                onPressed: () {
                                  firebaseAuth.sendPasswordResetEmail(
                                      email: widget.user.email);
                                  showAlertDialogType(context);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            widget.user.typeOfUser == "Student"
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: size.height / 12,
                      width: size.width / 2.2,
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.blue[700],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                "Matric No : " + widget.user.matric,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) =>
                                                ChangeNotifierProvider(
                                                  create: (context) =>
                                                      ProjectProvider(),
                                                  child: EditUserMatric(
                                                    user: widget.user,
                                                  ),
                                                ));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  showAlertDialogType(BuildContext _context) {
    // set up the button
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Password Successfully"),
            content: Text(
                "Reset password email has been sent to your email address"),
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

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 150);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
