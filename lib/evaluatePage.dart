import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/group.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/studentSidebar.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class EvaluatePage extends StatefulWidget {
  final Forms forms;
  final PeerUser evaluateUser;
  final PeerUser currentUser;
  final Courses course;
  final Group group;
  EvaluatePage(
      {Key key,
      @required this.forms,
      @required this.evaluateUser,
      @required this.course,
      @required this.currentUser,
      @required this.group})
      : super(key: key);

  @override
  _EvaluatePageState createState() => _EvaluatePageState();
}

class _EvaluatePageState extends State<EvaluatePage> {
  List answer;
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    answer = List(widget.forms.listOfRubric.length);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.blue[300],
            Colors.blue[500],
            Colors.blue[800],
          ],
        )),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                  child: Row(
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: FaIcon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      color: Colors.black,
                      size: 32,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ChangeNotifierProvider(
                            create: (context) => ProjectProvider(),
                            builder: (context, child) =>
                                StudentPage(users: widget.evaluateUser),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Home Page",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Container(
                  color: Colors.white54,
                  width: size.width / 1.4 - 20,
                  height: size.height / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "Peer Evaluation",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: Text(
                          "This form is used to evaluate your team members. Kindly provide your evaluation on each member of your team. Some proportions of the peer evaluation marks will be deducted if you fail to provide the evaluation of each of the member.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: Text(
                          "Form Name : " + widget.forms.formName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: Text(
                          "Form Code : " + widget.forms.formCode,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 25, 10, 10),
                            child: Text(
                              "Selected Peer : ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/header.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 25, 10),
                            child: Text(
                              widget.evaluateUser.userName,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width / 1.4,
              child: widget.forms.listOfRubric.length != 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.forms.listOfRubric.length,
                      itemBuilder: (context, index) {
                        return widget.forms.listOfRubric[index]['type'] ==
                                "Scale"
                            ? Card(
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.cyan[200],
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Question : " +
                                                          widget.forms
                                                                  .listOfRubric[
                                                              index]['question'],
                                                      style: TextStyle(
                                                          height: 1.3,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Type of Question : " +
                                                          widget.forms
                                                                  .listOfRubric[
                                                              index]["type"],
                                                      style: TextStyle(
                                                          height: 1.3,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(25.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 15, 20, 0),
                                                    child: Text(
                                                      widget.forms.listOfRubric[
                                                          index]['bad'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  RadioButtonForScale(
                                                      listOfRubric: widget
                                                          .forms.listOfRubric,
                                                      changelist: changelist,
                                                      index: index),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 15, 0, 0),
                                                    child: Text(
                                                      widget.forms.listOfRubric[
                                                          index]['good'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height / 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : widget.forms.listOfRubric[index]['type'] == "Text"
                                ? Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.cyan[200],
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "Question : " +
                                                              widget.forms.listOfRubric[
                                                                      index]
                                                                  ['question'],
                                                          style: TextStyle(
                                                              height: 1.3,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Type Of Question : " +
                                                              widget.forms
                                                                      .listOfRubric[
                                                                  index]['type'],
                                                          style: TextStyle(
                                                              height: 1.3,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //Display Textfield
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Container(
                                                      height: size.height / 4,
                                                      width: size.width / 4,
                                                      child: TextFormField(
                                                        onChanged: (value) {
                                                          answer[index] = value;
                                                        },
                                                        maxLength: 400,
                                                        maxLines: 10,
                                                        decoration:
                                                            new InputDecoration(
                                                          labelText:
                                                              "Your Answer",

                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              new OutlineInputBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    5.0),
                                                            borderSide:
                                                                new BorderSide(),
                                                          ),
                                                          //fillColor: Colors.green
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                // Multiple type
                                : Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.cyan[200],
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "Question : " +
                                                              widget.forms.listOfRubric[
                                                                      index]
                                                                  ['question'],
                                                          style: TextStyle(
                                                              height: 1.3,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Type of Question : " +
                                                              widget.forms
                                                                      .listOfRubric[
                                                                  index]['type'],
                                                          style: TextStyle(
                                                              height: 1.3,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RadiobuttonForMultiple(
                                                  listOfRubric:
                                                      widget.forms.listOfRubric,
                                                  index: index,
                                                  changelist: changelist,
                                                ),
                                                SizedBox(
                                                  height: size.height / 10,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                      })
                  : Center(
                      child: Text("No Rubrics Created"),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    height: 50,
                    minWidth: 130,
                    color: Colors.red[700],
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    height: 50,
                    minWidth: 130,
                    color: Colors.blue[700],
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      List<Map<String, dynamic>> questionNanswer = [];
                      bool validator = true;
                      int totalpoint = 0;
                      int studentpoint = 0;
                      int maxofscale = 0;
                      int maxofmulti = 0;
                      for (int i = 0;
                          i < widget.forms.listOfRubric.length;
                          i++) {
                        if (widget.forms.listOfRubric[i]['type'] == "Scale") {
                          for (int j = 0;
                              j <
                                  widget.forms.listOfRubric[i]['numberofscale']
                                      .length;
                              j++) {
                            if (widget.forms.listOfRubric[i]['numberofscale'][j]
                                    ["index"] >
                                maxofscale) {
                              maxofscale = widget.forms.listOfRubric[i]
                                  ['numberofscale'][j]["index"];
                            }
                          }
                          totalpoint = totalpoint + maxofscale;
                        } else if (widget.forms.listOfRubric[i]['type'] ==
                            "Multiple Choice") {
                          for (int k = 0;
                              k <
                                  widget
                                      .forms
                                      .listOfRubric[i]['multiplequestion']
                                      .length;
                              k++) {
                            if (widget.forms.listOfRubric[i]['multiplequestion']
                                    [k]["value"] >
                                maxofmulti) {
                              maxofmulti = widget.forms.listOfRubric[i]
                                  ['multiplequestion'][k]["value"];
                            }
                          }
                          totalpoint = totalpoint + maxofmulti;
                        }
                      }

                      for (int i = 0; i < answer.length; i++) {
                        if (answer[i] is String) {
                          Map<String, dynamic> answers = {
                            'questions': widget.forms.listOfRubric[i]
                                ["question"],
                            'answer': answer[i],
                          };
                          questionNanswer.add(answers);
                        } else if (answer[i] is int) {
                          studentpoint = studentpoint + answer[i];
                        } else {
                          questionNanswer = [];
                          validator = false;
                        }
                      }

                      if (validator == true) {
                        Map<String, dynamic> score = {
                          'coursename': widget.course.courseName,
                          'courseid': widget.course.courseID,
                          'coursecode': widget.course.courseCode,
                          'formname': widget.forms.formName,
                          'formid': widget.forms.formID,
                          'evaluateusername': widget.evaluateUser.userName,
                          'evaluateuseremail': widget.evaluateUser.email,
                          'totalpoint': totalpoint,
                          'studentpoint': studentpoint,
                          'questionNanswer': questionNanswer,
                          'currentuser': widget.currentUser.email,
                          'groupname': widget.group.groupName
                        };

                        provider.addScoretoList(widget.course, score);
                        successAlert(context);
                      } else {
                        nullAlert(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  changelist(int index, var value) {
    answer[index] = value;
  }

  nullAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("You need to fill in all the field"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  successAlert(BuildContext context) {
    var alert = AlertDialog(
      content: Text("Evaluate successfully"),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );

    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }
}

class RadioButtonForScale extends StatefulWidget {
  final List listOfRubric;
  final int index;
  final Function changelist;

  RadioButtonForScale({
    Key key,
    @required this.listOfRubric,
    @required this.index,
    @required this.changelist,
  }) : super(key: key);

  @override
  _RadioButtonForScaleState createState() => _RadioButtonForScaleState();
}

class _RadioButtonForScaleState extends State<RadioButtonForScale> {
  var groupvalue;
  List scale;

  @override
  void initState() {
    scale = widget.listOfRubric[widget.index]['numberofscale'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: scale
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: size.width / 25,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Radio(
                          value: e["index"],
                          groupValue: groupvalue,
                          onChanged: (value) {
                            setState(() {
                              groupvalue = value;
                              widget.changelist(widget.index, value);
                            });
                          },
                        ),
                      ),
                    ),
                    Text(e["index"].toString()),
                  ],
                ))
            .toList());
  }
}

class RadiobuttonForMultiple extends StatefulWidget {
  final List listOfRubric;
  final int index;
  final Function changelist;
  RadiobuttonForMultiple(
      {Key key,
      @required this.listOfRubric,
      @required this.index,
      @required this.changelist})
      : super(key: key);

  @override
  @override
  _RadiobuttonForMultipleState createState() => _RadiobuttonForMultipleState();
}

class _RadiobuttonForMultipleState extends State<RadiobuttonForMultiple> {
  List multi;
  var groupvalue;
  void initState() {
    multi = widget.listOfRubric[widget.index]['multiplequestion'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: multi
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: size.width / 25,
                        child: Transform.scale(
                          scale: 0.8,
                          child: Radio(
                            value: e['value'],
                            groupValue: groupvalue,
                            onChanged: (value) {
                              setState(() {
                                groupvalue = value;
                                widget.changelist(widget.index, value);
                              });
                            },
                          ),
                        ),
                      ),
                      Text(e["option"].toString()),
                    ],
                  ),
                ))
            .toList());
  }
}
