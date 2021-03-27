import 'package:flutter/cupertino.dart';
import 'package:pepelist/objects/rubric.dart';

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
        listOfRubric: json['listr']);
  }

  Map<String, dynamic> toJson() {
    return {
      "formcode": formCode,
      "formid": formID,
      "formname": formName,
      "listr": listOfRubric,
    };
  }
}
