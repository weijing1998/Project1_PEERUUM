import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
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
      decoration: BoxDecoration(color: Colors.blue[200]),
      padding: EdgeInsets.all(32),
      height: size.height,
      width: size.width - size.width / 6,
      child: Row(
        children: [Text('FORM PAGE')],
      ),
    );
  }
}
