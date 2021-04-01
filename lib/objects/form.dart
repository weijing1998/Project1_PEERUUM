import 'package:flutter/cupertino.dart';

class Forms {
  String formName;
  String formID;
  String formCode;
  List listOfRubric;

  Forms({
    this.formName,
   @required this.formID,
    this.formCode,
    this.listOfRubric,
  });

  factory Forms.fromJson(Map<String, dynamic> json) {
    return Forms(
        formCode: json["formcode"],
        formID: json['formid'],
        formName: json['formname'],
        listOfRubric: json['listofrubric']);
  }

  Map<String, dynamic> toJson() {
    return {
      "formcode": formCode,
      "formid": formID,
      "formname": formName,
      "listofrubric": listOfRubric,
    };
  }
}
