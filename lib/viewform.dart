import 'package:flutter/material.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class ViewFormPage extends StatefulWidget {
  ViewFormPage({
    Key key,
  }) : super(key: key);

  @override
  _ViewFormPageState createState() => _ViewFormPageState();
}

class _ViewFormPageState extends State<ViewFormPage> {
  List<TextEditingController> controllers = [];
  List listofrubric;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<ProjectProvider>(context);
    return StreamBuilder<Forms>(
        stream: provider.form,
        builder: (context, snapshot) {
          return Container(
            height: size.height,
            width: size.width - size.width / 6,
            child: SingleChildScrollView(
              child: snapshot.hasData
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(150, 20, 0, 20),
                              child: Text(
                                "FORM DETAIL",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),

                            //Edit Form Button

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 160),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                        create: (context) => ProjectProvider(),
                                        child: EditFormDialog(
                                            forms: snapshot.data),
                                      ),
                                    );
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.purple[400],
                                          Colors.purple[800]
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 130.0, minHeight: 40.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Edit Form",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //FORM detail
                        Container(
                          height: size.height / 3,
                          width: size.width / 1.5,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.purple[200].withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ], color: Colors.grey[200]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "FORM NAME : " + snapshot.data.formName,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "FORM CODE : " + snapshot.data.formCode,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "NUMBER OF RUBRIC : " +
                                      snapshot.data.listOfRubric.length
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height / 18,
                        ),

                        //Rubric detail
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(160, 0, 0, 0),
                                child: Text(
                                  "EVALUATION RUBRICS",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 160, 0),
                              child: Container(
                                child: Row(
                                  children: [
                                    //ADD Rubric Button

                                    snapshot.data.formID ==
                                            "95dda0f0-b73d-11eb-bd67-8f40fbcbf0d9"
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) =>
                                                        ChangeNotifierProvider(
                                                      create: (context) =>
                                                          ProjectProvider(),
                                                      child: AddRubricDialog(
                                                          forms: snapshot.data),
                                                    ),
                                                  );
                                                });
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0)),
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.purple[400],
                                                        Colors.purple[800]
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 130.0,
                                                      minHeight: 40.0),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Add Rubric",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        SingleChildScrollView(
                          child: Container(
                            height: size.height / 1.45,
                            width: size.width / 1.5,
                            color: Colors.grey[300],
                            child: snapshot.data.listOfRubric.length != 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data.listOfRubric.length,
                                    itemBuilder: (context, index) {
                                      controllers.add(TextEditingController(
                                          text: "Your Answer"));
                                      return snapshot.data.listOfRubric[index]
                                                  ['type'] ==
                                              "Scale"
                                          ? Card(
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.purple[50],
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                    "Question : " +
                                                                        snapshot
                                                                            .data
                                                                            .listOfRubric[index]['question'],
                                                                    style: TextStyle(
                                                                        height:
                                                                            1.3,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    "Type of Question : " +
                                                                        snapshot
                                                                            .data
                                                                            .listOfRubric[index]["type"],
                                                                    style: TextStyle(
                                                                        height:
                                                                            1.3,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0,
                                                                          15,
                                                                          20,
                                                                          0),
                                                                  child: Text(
                                                                    snapshot.data
                                                                            .listOfRubric[index]
                                                                        ['bad'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                RadioButtonForScale(
                                                                    listOfRubric:
                                                                        snapshot
                                                                            .data
                                                                            .listOfRubric,
                                                                    index:
                                                                        index),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          20,
                                                                          15,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    snapshot.data
                                                                            .listOfRubric[index]
                                                                        [
                                                                        'good'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          snapshot.data
                                                                      .formID ==
                                                                  "95dda0f0-b73d-11eb-bd67-8f40fbcbf0d9"
                                                              ? SizedBox(
                                                                  height: 30,
                                                                )
                                                              : Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          50,
                                                                      vertical:
                                                                          30),
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: IconButton(
                                                                        hoverColor: Colors.purple,
                                                                        tooltip: "Delete Rubric",
                                                                        icon: Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              Colors.grey[600],
                                                                          size:
                                                                              38,
                                                                        ),
                                                                        onPressed: () {
                                                                          listofrubric = snapshot
                                                                              .data
                                                                              .listOfRubric;
                                                                          listofrubric
                                                                              .removeAt(index);
                                                                          provider.deleteRubricfromForm(
                                                                              snapshot.data,
                                                                              listofrubric);
                                                                        }),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : snapshot.data.listOfRubric[index]
                                                      ['type'] ==
                                                  "Text"
                                              ? Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: Colors.purple[50],
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Text(
                                                                        "Question : " +
                                                                            snapshot.data.listOfRubric[index]['question'],
                                                                        style: TextStyle(
                                                                            height:
                                                                                1.3,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Text(
                                                                        "Question : " +
                                                                            snapshot.data.listOfRubric[index]['type'],
                                                                        style: TextStyle(
                                                                            height:
                                                                                1.3,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              //Display Textfield
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        size.height /
                                                                            4,
                                                                    width:
                                                                        size.width /
                                                                            4,
                                                                    child:
                                                                        TextFormField(
                                                                      maxLength:
                                                                          400,
                                                                      maxLines:
                                                                          10,
                                                                      controller:
                                                                          controllers[
                                                                              index],
                                                                      decoration:
                                                                          new InputDecoration(
                                                                        labelText:
                                                                            "Your Answer",

                                                                        fillColor:
                                                                            Colors.white,
                                                                        border:
                                                                            new OutlineInputBorder(
                                                                          borderRadius:
                                                                              new BorderRadius.circular(5.0),
                                                                          borderSide:
                                                                              new BorderSide(),
                                                                        ),
                                                                        //fillColor: Colors.green
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              snapshot.data
                                                                          .formID ==
                                                                      "95dda0f0-b73d-11eb-bd67-8f40fbcbf0d9"
                                                                  ? SizedBox(
                                                                      height:
                                                                          30,
                                                                    )
                                                                  : Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              50,
                                                                          vertical:
                                                                              30),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.bottomRight,
                                                                        child: IconButton(
                                                                            hoverColor: Colors.purple,
                                                                            tooltip: "Delete Rubric",
                                                                            icon: Icon(
                                                                              Icons.delete,
                                                                              color: Colors.grey[600],
                                                                              size: 38,
                                                                            ),
                                                                            onPressed: () {
                                                                              listofrubric = snapshot.data.listOfRubric;
                                                                              listofrubric.removeAt(index);
                                                                              provider.deleteRubricfromForm(snapshot.data, listofrubric);
                                                                            }),
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
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: Colors.purple[50],
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "Question : " +
                                                                            snapshot.data.listOfRubric[index]['question'],
                                                                        style: TextStyle(
                                                                            height:
                                                                                1.3,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        "Type of Question : " +
                                                                            snapshot.data.listOfRubric[index]['type'],
                                                                        style: TextStyle(
                                                                            height:
                                                                                1.3,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              RadiobuttonForMultiple(
                                                                  listOfRubric:
                                                                      snapshot
                                                                          .data
                                                                          .listOfRubric,
                                                                  index: index),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        50,
                                                                    vertical:
                                                                        30),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child: IconButton(
                                                                      hoverColor: Colors.purple,
                                                                      tooltip: "Delete Rubric",
                                                                      icon: Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Colors
                                                                            .grey[600],
                                                                        size:
                                                                            38,
                                                                      ),
                                                                      onPressed: () {
                                                                        listofrubric = snapshot
                                                                            .data
                                                                            .listOfRubric;
                                                                        listofrubric
                                                                            .removeAt(index);
                                                                        provider.deleteRubricfromForm(
                                                                            snapshot.data,
                                                                            listofrubric);
                                                                      }),
                                                                ),
                                                              ),
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
                        ),
                        SizedBox(
                          height: size.height / 4,
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ),
                    ),
            ),
          );
        });
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
  RadiobuttonForMultiple({
    Key key,
    @required this.listOfRubric,
    @required this.index,
  }) : super(key: key);

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
                      Flexible(
                        child: Text(
                          e["option"].toString(),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList());
  }
}
