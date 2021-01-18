import 'package:flutter/material.dart';
import 'package:pepelist/objects/course.dart';

class FormPage extends StatefulWidget {
  final Data data;

  const FormPage({Key key, @required this.data}) : super(key: key);

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(85, 0, 10, 0),
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
         
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                  child: Container(
                    height: 45,
                    width: 150,
                    child: FlatButton(
                      color: Colors.blue[900],
                      focusColor: Colors.lightBlue,
                      textColor: Colors.white,
                      onPressed: () {
                    
                      },
                      child: Text(
                        "Add Forms",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
