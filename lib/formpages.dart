import 'package:flutter/material.dart';
import 'package:pepelist/objects/data.dart';
import 'package:pepelist/utils/crudWidget.dart';

class FormPage extends StatefulWidget {
  final Data data;
  final Function toggleFormpage;
  final Function passForm;
  final Function currentindex;

  const FormPage({Key key, @required this.data, @required this.toggleFormpage,@required this.passForm,@required this.currentindex}) : super(key: key);

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
                    child: Image.network(
                      "images/formspic.png",
                      scale: 9,
                    ),
                  ),
                  Text(
                    'FORM PAGE',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
                      height: 45,
                      width: 150,
                      child: FlatButton(
                        color: Colors.purple[800],
                        focusColor: Colors.purple[700],
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (context) => AddFormDialog(
                                data: widget.data,
                                resetFromPage: resetformpage,
                              ),
                            );
                          });
                        },
                        child: Text(
                          "Add Forms",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                    child: Container(
                      height: 45,
                      width: 150,
                      child: FlatButton(
                        color: Colors.purple[800],
                        focusColor: Colors.purple[700],
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (context) => DeleteFormDialog(
                                data: widget.data,
                                refreshformpage: resetformpage,
                              ),
                            );
                          });
                        },
                        child: Text(
                          "Delete Forms",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //Form Pages List
          SingleChildScrollView(
            child: Container(
                height: size.height / 1.42,
                width: size.width / 1.3,
                color: Colors.grey[300],
                child: widget.data.forms.length < 1
                    ? Center(
                        child: Text(
                          "No Forms Created",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.data.forms.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 200,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Form Name
                                    Container(
                                      color: Colors.purple[300],
                                      height: 50,
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            " FORMS NAME : " +
                                                widget
                                                    .data.forms[index].formName
                                                    .toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      color: Colors.blueGrey[50],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: size.width / 1.9,
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //Form ID
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.article,
                                                            size: 25,
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            "FORM ID : " +
                                                                widget
                                                                    .data
                                                                    .forms[
                                                                        index]
                                                                    .formID,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.article,
                                                            size: 25,
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            "NUMBER OF QUESTION: " +
                                                                widget
                                                                    .data
                                                                    .forms[
                                                                        index]
                                                                    .listOfRubric
                                                                    .length
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25),
                                            child: Container(
                                              height: 40,
                                              width: size.width / 12,
                                              child: FlatButton(
                                                color: Colors.purple[800],
                                                onPressed: () {
                                                    widget.toggleFormpage(true);
                                                widget.passForm(
                                                    widget.data.forms[index]);
                                                widget.currentindex(index);
                                                },
                                                child: Text(
                                                  "View Form",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
          ),
        ],
      ),
    );
  }

  void resetformpage() {
    setState(() {});
  }
}
