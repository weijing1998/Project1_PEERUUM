import 'package:flutter/cupertino.dart';

class Forms {
  String formName;
  String formID;
  String formCode;
  List listOfRubric;
  String formowner;

  Forms({
    this.formName,
    @required this.formID,
    this.formCode,
    this.listOfRubric,
    @required this.formowner,
  });

  factory Forms.fromJson(Map<String, dynamic> json) {
    return Forms(
        formCode: json["formcode"],
        formID: json['formid'],
        formName: json['formname'],
        listOfRubric: json['listofrubric'],
        formowner: json["formowner"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "formcode": formCode,
      "formid": formID,
      "formname": formName,
      "listofrubric": listOfRubric,
      "formowner": formowner
    };
  }
}
