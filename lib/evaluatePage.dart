import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/studentSidebar.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class EvaluatePage extends StatefulWidget {
  final Forms forms;
  final PeerUser user;
  EvaluatePage({Key key, @required this.forms, @required this.user})
      : super(key: key);

  @override
  _EvaluatePageState createState() => _EvaluatePageState();
}

List answer;

class _EvaluatePageState extends State<EvaluatePage> {
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
                                StudentPage(users: widget.user),
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
                              widget.user.userName,
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
                MaterialButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
                MaterialButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class RadioButtonForScale extends StatefulWidget {
  final List listOfRubric;
  final int index;

  RadioButtonForScale({
    Key key,
    @required this.listOfRubric,
    @required this.index,
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
  RadiobuttonForMultiple(
      {Key key, @required this.listOfRubric, @required this.index})
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