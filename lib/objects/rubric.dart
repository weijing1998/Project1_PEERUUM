class Rubric {
  String question;
  String type;
  String scaleAnswer;
  String textAnswer;
  String good;
  String bad;
  

  Rubric(String question, String type , String scaleAnswers, String textanswer, String good, String bad) {
    this.question = question;
    this.type = type;
    this.bad=bad;
    this.good=good;
    this.scaleAnswer=scaleAnswers;
    this.textAnswer=textanswer;
  }
}
