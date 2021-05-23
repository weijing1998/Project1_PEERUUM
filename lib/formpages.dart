import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';
import 'package:pepelist/objects/peerUser.dart';
import 'package:pepelist/utils/crudWidget.dart';
import 'package:pepelist/utils/projetcProvider.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  final PeerUser user;
  final Function toggleFormpage;

  const FormPage({
    Key key,
    @required this.toggleFormpage,
    @required this.user,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double total = (width + height) / 2 / 100;
    var provider = Provider.of<ProjectProvider>(context);
    return StreamBuilder<List<Forms>>(
        stream: provider.formList,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            padding: EdgeInsets.all(32),
            height: size.height,
            width: size.width - size.width / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 10, 0),
                          child: Container(
                            height: height * 0.08,
                            width: width * 0.04,
                            child: Image.network(
                              "assets/images/formspic.png",
                            ),
                          ),
                        ),
                        Text(
                          'FORM PAGE',
                          style: TextStyle(
                              fontSize: total * 2, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: MaterialButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                          create: (context) =>
                                              ProjectProvider(),
                                          child: AddFormDialog(
                                            user: widget.user,
                                          ),
                                        ));
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
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: width * 0.09,
                                      maxHeight: height * 0.05),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add Form",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: MaterialButton(
                              onPressed: snapshot.hasData
                                  ? () {
                                      setState(() {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) =>
                                              ChangeNotifierProvider(
                                            create: (context) =>
                                                ProjectProvider(),
                                            child: DeleteFormDialog(
                                              user: widget.user,
                                              forms: snapshot.data,
                                            ),
                                          ),
                                        );
                                      });
                                    }
                                  : () {},
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
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: width * 0.09,
                                      maxHeight: height * 0.05),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Delete Form",
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
                    ),
                  ],
                ),

                // //Form Pages List
                SingleChildScrollView(
                  child: Container(
                    height: size.height / 1.42,
                    width: size.width / 1.3,
                    color: Colors.grey[300],
                    child: snapshot.hasData
                        ? snapshot.data.length < 1
                            ? Center(
                                child: Text(
                                  "No Forms Created",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return snapshot.data[index].formowner ==
                                              widget.user.userid ||
                                          snapshot.data[index].formowner ==
                                              "default"
                                      ? Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              height: height * 0.25,
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //Form Name
                                                  Container(
                                                    color: Colors.purple[300],
                                                    width: double.infinity,
                                                    height: height * 0.05,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Text(
                                                            " FORMS NAME : " +
                                                                snapshot
                                                                    .data[index]
                                                                    .formName
                                                                    .toUpperCase(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: total * 1.4),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: IconButton(
                                                              tooltip:
                                                                  "Copy Form",
                                                              focusColor:
                                                                  Colors.grey,
                                                              hoverColor: Colors
                                                                  .grey[300],
                                                              onPressed: () {
                                                                showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          ChangeNotifierProvider(
                                                                    create: (context) =>
                                                                        ProjectProvider(),
                                                                    child: CopyFormDialog(
                                                                        user: widget
                                                                            .user,
                                                                        forms: snapshot
                                                                            .data[index]),
                                                                  ),
                                                                );
                                                              },
                                                              icon: Icon(
                                                                Icons.copy,
                                                                color: Colors
                                                                    .black,
                                                                    size: total * 1.5,
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: height * 0.2,
                                                    width: double.infinity,
                                                    color: Colors.blueGrey[50],
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width:
                                                              size.width / 2.3,
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  //Form ID
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .article,
                                                                          size:
                                                                              total * 1.3,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "FORM CODE : " +
                                                                              snapshot.data[index].formCode.toUpperCase(),
                                                                          style: TextStyle(
                                                                              fontSize: total * 1.1,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .article,
                                                                          size:
                                                                              total * 1.3,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "NUMBER OF QUESTION: " +
                                                                              snapshot.data[index].listOfRubric.length.toString(),
                                                                          style: TextStyle(
                                                                              fontSize: total * 1.1,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  15),
                                                          child: MaterialButton(
                                                            onPressed: () {
                                                              provider.setFormId(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .formID);
                                                              widget
                                                                  .toggleFormpage(
                                                                      true);
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80.0)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            child: Ink(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Colors
                                                                              .purple[400],
                                                                          Colors
                                                                              .purple[800]
                                                                        ],
                                                                        begin: Alignment
                                                                            .centerLeft,
                                                                        end: Alignment
                                                                            .centerRight,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0)),
                                                              child: Container(
                                                                constraints: BoxConstraints(
                                                                    maxWidth:
                                                                        width *
                                                                            0.09,
                                                                    maxHeight:
                                                                        height *
                                                                            0.05),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "View Form",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                                List<Courses>>(
                                                            stream: provider
                                                                .courselist,
                                                            builder: (context,
                                                                snapshotcourses) {
                                                              return snapshotcourses
                                                                      .hasData
                                                                  ? Container(
                                                                      margin: EdgeInsets
                                                                          .all(
                                                                              15),
                                                                      child:
                                                                          MaterialButton(
                                                                        onPressed:
                                                                            () {
                                                                          provider.setFormId(snapshot
                                                                              .data[index]
                                                                              .formID);
                                                                          showDialog(
                                                                              barrierDismissible: false,
                                                                              context: context,
                                                                              builder: (context) => ChangeNotifierProvider(
                                                                                    create: (context) => ProjectProvider(),
                                                                                    child: ApplyFormDialog(
                                                                                      forms: snapshot.data[index],
                                                                                      snapshot: snapshotcourses.data,
                                                                                    ),
                                                                                  ));
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(80.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Colors.purple[400],
                                                                                  Colors.purple[800]
                                                                                ],
                                                                                begin: Alignment.centerLeft,
                                                                                end: Alignment.centerRight,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(30.0)),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(maxWidth: width * 0.09, maxHeight: height * 0.05),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              "Apply Form",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 12),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Center(
                                                                      child: Container(
                                                                          height: size.height / 20,
                                                                          width: size.width / 40,
                                                                          child: Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              strokeWidth: 3,
                                                                            ),
                                                                          )),
                                                                    );
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox();
                                },
                              )
                        : Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                )),
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
