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
  int selectedRadio;
  List<TextEditingController> controllers = [];

  void setSelectedRadio(int radio) {
    setState(() {
      selectedRadio = radio;
    });
  }

  @override
  void initState() {
    selectedRadio = 0;
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
                                  const EdgeInsets.fromLTRB(0, 20, 180, 20),
                              child: Container(
                                height: 40,
                                width: 120,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ChangeNotifierProvider(
                                          create: (context) =>
                                              ProjectProvider(),
                                          child: EditFormDialog(
                                              forms: snapshot.data),
                                        ),
                                      );
                                    });
                                  },
                                  child: Text(
                                    "Edit Form",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  color: Colors.purple[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //FORM detail
                        Container(
                          height: size.height / 3,
                          width: size.width / 1.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.purpleAccent, width: 2),
                              color: Colors.grey[300]),
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
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "FORM CODE : " + snapshot.data.formCode,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "NUMBER OF RUBRIC : ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
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
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        child: MaterialButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   showDialog(
                                            //     context: context,
                                            //     builder: (context) => AddRubricDialog(
                                            //         forms: widget.form,
                                            //         resetViewFormPage:
                                            //             resetViewForms),
                                            //   );
                                            // });
                                          },
                                          child: Text(
                                            "Add Rubric",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          color: Colors.purple[800],
                                        ),
                                      ),
                                    ),

                                    // Edit Rubric Button
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        child: MaterialButton(
                                          // onPressed: widget.form.formName.length != 0
                                          //     ? () {
                                          //         showDialog();
                                          //       }
                                          //     : () {},
                                          child: Text(
                                            "Edit Rubric",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          color: Colors.purple[800],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        // SingleChildScrollView(
                        //   child: Container(
                        //     height: size.height / 1.45,
                        //     width: size.width / 1.5,
                        //     color: Colors.grey[300],
                        //     child: widget.form.listOfRubric.length != 0
                        //         ? ListView.builder(
                        //             shrinkWrap: true,
                        //             itemCount: widget.form.listOfRubric.length,
                        //             itemBuilder: (context, index) {
                        //               controllers.add(
                        //                   TextEditingController(text: "Your Answer"));
                        //               return widget.form.listOfRubric[index].type ==
                        //                       "Scale"
                        //                   ? Card(
                        //                       child: Padding(
                        //                         padding: EdgeInsets.all(4.0),
                        //                         child: Container(
                        //                           width: double.infinity,
                        //                           color: Colors.purple[50],
                        //                           child: Stack(
                        //                             children: [
                        //                               Column(
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment.start,
                        //                                 children: [
                        //                                   Padding(
                        //                                     padding:
                        //                                         const EdgeInsets.all(
                        //                                             15.0),
                        //                                     child: Container(
                        //                                       child: Text(
                        //                                         "Question : " +
                        //                                             widget
                        //                                                 .form
                        //                                                 .listOfRubric[
                        //                                                     index]
                        //                                                 .question,
                        //                                         style: TextStyle(
                        //                                             height: 1.3,
                        //                                             fontSize: 20,
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w400),
                        //                                       ),
                        //                                     ),
                        //                                   ),
                        //                                   Padding(
                        //                                     padding:
                        //                                         const EdgeInsets.all(
                        //                                             25.0),
                        //                                     child: Row(
                        //                                       mainAxisAlignment:
                        //                                           MainAxisAlignment
                        //                                               .center,
                        //                                       children: <Widget>[
                        //                                         Padding(
                        //                                           padding:
                        //                                               const EdgeInsets
                        //                                                       .fromLTRB(
                        //                                                   0,
                        //                                                   15,
                        //                                                   20,
                        //                                                   0),
                        //                                           child: Text(
                        //                                             widget
                        //                                                 .form
                        //                                                 .listOfRubric[
                        //                                                     index]
                        //                                                 .bad,
                        //                                             style: TextStyle(
                        //                                                 fontSize: 15,
                        //                                                 fontWeight:
                        //                                                     FontWeight
                        //                                                         .w400),
                        //                                           ),
                        //                                         ),
                        //                                         ButtonBar(
                        //                                           alignment:
                        //                                               MainAxisAlignment
                        //                                                   .center,
                        //                                           children: [
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("1"),
                        //                                                 Radio(
                        //                                                     value: 1,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setState(
                        //                                                           () {});
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("2"),
                        //                                                 Radio(
                        //                                                     value: 2,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("3"),
                        //                                                 Radio(
                        //                                                     value: 3,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("4"),
                        //                                                 Radio(
                        //                                                     value: 4,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("5"),
                        //                                                 Radio(
                        //                                                     value: 5,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("6"),
                        //                                                 Radio(
                        //                                                     value: 6,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("7"),
                        //                                                 Radio(
                        //                                                     value: 7,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("8"),
                        //                                                 Radio(
                        //                                                     value: 8,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("9"),
                        //                                                 Radio(
                        //                                                     value: 9,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                             Column(
                        //                                               children: [
                        //                                                 Text("10"),
                        //                                                 Radio(
                        //                                                     value: 10,
                        //                                                     groupValue:
                        //                                                         selectedRadio,
                        //                                                     activeColor:
                        //                                                         Colors.purple[
                        //                                                             700],
                        //                                                     onChanged:
                        //                                                         (val) {
                        //                                                       print(
                        //                                                           "Radio $val");
                        //                                                       setSelectedRadio(
                        //                                                           val);
                        //                                                     }),
                        //                                               ],
                        //                                             ),
                        //                                           ],
                        //                                         ),
                        //                                         Padding(
                        //                                           padding:
                        //                                               const EdgeInsets
                        //                                                       .fromLTRB(
                        //                                                   20,
                        //                                                   15,
                        //                                                   0,
                        //                                                   0),
                        //                                           child: Text(
                        //                                             widget
                        //                                                 .form
                        //                                                 .listOfRubric[
                        //                                                     index]
                        //                                                 .good,
                        //                                             style: TextStyle(
                        //                                                 fontSize: 15,
                        //                                                 fontWeight:
                        //                                                     FontWeight
                        //                                                         .w400),
                        //                                           ),
                        //                                         ),
                        //                                       ],
                        //                                     ),
                        //                                   ),
                        //                                   Padding(
                        //                                     padding: const EdgeInsets
                        //                                             .symmetric(
                        //                                         horizontal: 50,
                        //                                         vertical: 30),
                        //                                     child: Align(
                        //                                       alignment: Alignment
                        //                                           .bottomRight,
                        //                                       child: IconButton(
                        //                                           hoverColor:
                        //                                               Colors.purple,
                        //                                           tooltip:
                        //                                               "Delete Rubric",
                        //                                           icon: Icon(
                        //                                             Icons.delete,
                        //                                             color: Colors
                        //                                                 .grey[600],
                        //                                             size: 38,
                        //                                           ),
                        //                                           onPressed: () {
                        //                                             setState(() {
                        //                                               widget.form
                        //                                                   .listOfRubric
                        //                                                   .removeAt(
                        //                                                       index);
                        //                                             });
                        //                                           }),
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   : Card(
                        //                       child: Padding(
                        //                         padding: EdgeInsets.all(4.0),
                        //                         child: Container(
                        //                           width: double.infinity,
                        //                           color: Colors.purple[50],
                        //                           child: Stack(
                        //                             children: [
                        //                               Column(
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment.start,
                        //                                 children: [
                        //                                   Padding(
                        //                                     padding:
                        //                                         const EdgeInsets.all(
                        //                                             15.0),
                        //                                     child: Container(
                        //                                       child: Text(
                        //                                         "Question : " +
                        //                                             widget
                        //                                                 .form
                        //                                                 .listOfRubric[
                        //                                                     index]
                        //                                                 .question,
                        //                                         style: TextStyle(
                        //                                             height: 1.3,
                        //                                             fontSize: 20,
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w400),
                        //                                       ),
                        //                                     ),
                        //                                   ),
                        //                                   //Display Textfield
                        //                                   Align(
                        //                                     alignment:
                        //                                         Alignment.centerLeft,
                        //                                     child: Padding(
                        //                                       padding: EdgeInsets.all(
                        //                                           20.0),
                        //                                       child: Container(
                        //                                         height: 50,
                        //                                         width: size.width / 4,
                        //                                         child: TextFormField(
                        //                                           controller:
                        //                                               controllers[
                        //                                                   index],
                        //                                           decoration:
                        //                                               new InputDecoration(
                        //                                             labelText:
                        //                                                 "Your Answer",

                        //                                             fillColor:
                        //                                                 Colors.white,
                        //                                             border:
                        //                                                 new OutlineInputBorder(
                        //                                               borderRadius:
                        //                                                   new BorderRadius
                        //                                                           .circular(
                        //                                                       5.0),
                        //                                               borderSide:
                        //                                                   new BorderSide(),
                        //                                             ),
                        //                                             //fillColor: Colors.green
                        //                                           ),
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ),

                        //                                   Padding(
                        //                                     padding: const EdgeInsets
                        //                                             .symmetric(
                        //                                         horizontal: 50,
                        //                                         vertical: 30),
                        //                                     child: Align(
                        //                                       alignment: Alignment
                        //                                           .bottomRight,
                        //                                       child: IconButton(
                        //                                           hoverColor:
                        //                                               Colors.purple,
                        //                                           tooltip:
                        //                                               "Delete Rubric",
                        //                                           icon: Icon(
                        //                                             Icons.delete,
                        //                                             color: Colors
                        //                                                 .grey[600],
                        //                                             size: 38,
                        //                                           ),
                        //                                           onPressed: () {
                        //                                             setState(() {
                        //                                               widget.form
                        //                                                   .listOfRubric
                        //                                                   .removeAt(
                        //                                                       index);
                        //                                             });
                        //                                           }),
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     );
                        //             })
                        //         : Center(
                        //             child: Text("No Rubrics Created"),
                        //           ),
                        //   ),
                        // ),
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

  void resetViewForms() {
    setState(() {});
  }
}
