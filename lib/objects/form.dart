import 'package:pepelist/objects/rubric.dart';

class Forms {
  String formName;
  String formID;
  List<Rubric> listOfRubric;

  Forms(String fn, String fID) {
    this.formName = fn;
    this.formID = fID;

    listOfRubric = [
      Rubric("HOW WAS YOUR FRIEND PERFORME", "scale", " 4", ""),
      Rubric("HOW WAS YOUR FRIEND PERFORME", "scale", " 4", ""),
      Rubric("HOW WAS YOUR FRIEND PERFORME", "scale", " 4", ""),
      Rubric("HOW WAS YOUR FRIEND PERFORME", "scale", " 4", ""),
    ];
  }
}
