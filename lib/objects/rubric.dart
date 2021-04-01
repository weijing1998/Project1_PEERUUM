class Rubric {
  String question;
  String type;
  String scaleAnswer;
  String textAnswer;
  String scaleHighLable;
  String scaleLowLable;
  String rubricId;
  List numberOfscale;
  List multipleQuestion;

  Rubric(
      {this.scaleLowLable,
      this.scaleHighLable,
      this.question,
      this.scaleAnswer,
      this.textAnswer,
      this.type,
      this.rubricId,
      this.numberOfscale,
      this.multipleQuestion});

  factory Rubric.fromJson(Map<String, dynamic> json) {
    return Rubric(
        question: json["question"],
        type: json["type"],
        scaleAnswer: json["scaleanswer"],
        scaleLowLable: json["bad"],
        scaleHighLable: json["good"],
        rubricId: json["rubricid"],
        textAnswer: json["textanswer"],
        numberOfscale: json['numberofscale'],
        multipleQuestion: json['multiplequstion']);
  }

  Map<String, dynamic> toJson() {
    return {
      "question": question,
      "type": type,
      "scaleanswer": scaleAnswer,
      "bad": scaleLowLable,
      "good": scaleHighLable,
      "rubricid": rubricId,
      "textanswer": textAnswer,
      'numberofscale': numberOfscale,
      'multiplequestion': multipleQuestion,
    };
  }
}
