import 'package:pepelist/objects/course.dart';
import 'package:pepelist/objects/form.dart';

class Data {
  List<Courses> courses;
  List<Forms> forms;
  

  Data() {
    courses = [
      // Courses("WEB ENGINNERING", "STIW3045", "A", "A201"),
      // Courses("SOFTWARE TESTING", "STIW3045", "A", "A201"),
      // Courses("PUBLIC SPEAKING", "STIW3045", "A", "A201"),
      // Courses("OPERATING SYSTEM", "STIW3045", "A", "A201"),
      // Courses("SOFTWARE ENGINEERING", "STIW3045", "A", "A201")
      Courses("PROJECT 1", "STIX3913", "C", "A201")
    ];

    forms=[
      Forms("Default Form", "1"),
  
    ];

  }
}