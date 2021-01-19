import 'package:flutter/material.dart';
import 'package:pepelist/objects/data.dart';
import 'package:pepelist/objects/form.dart';

class ViewFormPage extends StatefulWidget {
  final Forms form;
  final Data data;
  final int formIndex;
  ViewFormPage(
      {Key key,
      @required this.form,
      @required this.data,
      @required this.formIndex})
      : super(key: key);

  @override
  _ViewFormPageState createState() => _ViewFormPageState();
}

class _ViewFormPageState extends State<ViewFormPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width - size.width / 6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 0, 20),
                  child: Text(
                    "FORM DETAIL",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                //Edit Form Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 180, 20),
                  child: Container(
                    height: 40,
                    width: 120,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          showDialog();
                        });
                      },
                      child: Text(
                        "Edit Form",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue[900],
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
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "FORM NAME : " + widget.form.formName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "FORM ID : " + widget.form.formID,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "NUMBER OF RUBRIC : " +
                          widget.form.listOfRubric.length.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
              children: [
                SizedBox(
                  width: size.width / 14,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Text(
                      "RUBRIC DETAIL",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 3.2,
                ),
                Container(
                  child: Row(
                    children: [
                      //ADD Rubric Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                showDialog();
                              });
                            },
                            child: Text(
                              "Add Rubric",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),

                      // Edit Rubric Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: widget.form.formName.length != 0
                                ? () {
                                    showDialog();
                                  }
                                : () {},
                            child: Text(
                              "Edit Rubric",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                      //Delete Rubric Button
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: FlatButton(
                            onPressed: widget.form.formName.length != 0
                                ? () {}
                                : () {},
                            child: Text(
                              "Delete Rubric",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SingleChildScrollView(
              child: Container(
                height: size.height / 1.45,
                width: size.width / 1.5,
                color: Colors.grey[300],
                child: widget.form.listOfRubric.length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.form.listOfRubric.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                height: 600,
                                width: double.infinity,
                                color: Colors.purple[50],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text("No Group Created"),
                      ),
              ),
            ),
            SizedBox(
              height: size.height / 4,
            ),
          ],
        ),
      ),
    );
  }

  void reset() {
    setState(() {});
  }
}
