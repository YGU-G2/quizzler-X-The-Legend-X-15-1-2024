import 'package:flutter/material.dart';

class MyQuestions {
  MyQuestions(
    this.questionsText,
    this.isTrue,
    this.icon,
  );
  String questionsText;
  bool isTrue;
  var icon;
}

List<MyQuestions> myQuestionsList = [
  MyQuestions("السهم يشير لليمين", true, Icons.arrow_forward),
  MyQuestions("السهم يشير لليسار", false, Icons.arrow_forward),
  MyQuestions("السهم يشير للأعلى", true, Icons.arrow_upward),
  MyQuestions("السهم يشير للأسفل", false, Icons.arrow_back),
  MyQuestions("السهم يشير للأسفل", true, Icons.arrow_downward),
  MyQuestions("السهم يشير لليسار", true, Icons.arrow_back),
  MyQuestions("السهم يشير لليمين", true, Icons.arrow_forward),
  MyQuestions("السهم يشير للأعلى", false, Icons.arrow_downward),
  MyQuestions("السهم لا يشير لليسار", true, Icons.arrow_forward),
  MyQuestions("السهم يشير لليمين", true, Icons.arrow_forward),
  MyQuestions("السهم لا يشير لليمين", false, Icons.arrow_forward),
  MyQuestions("السهم يشير للاسفل", false, Icons.arrow_upward),
  MyQuestions("السهم لا يشير للاعلى", false, Icons.arrow_upward),
  MyQuestions("السهم يشير لليسار", false, Icons.arrow_forward),
  MyQuestions("السهم يشير لليمين", false, Icons.arrow_back),
  MyQuestions("السهم لا يشير للأسفل", false, Icons.arrow_downward),
  MyQuestions("السهم لا يشير لليسار", true, Icons.arrow_forward),
  MyQuestions("السهم يشير لليسار", false, Icons.arrow_forward),
  MyQuestions("السهم يشير لليمين", true, Icons.arrow_forward),
  MyQuestions("السهم يشير للأعلى", true, Icons.arrow_upward),
  MyQuestions("السهم يشير للأسفل", false, Icons.arrow_upward),
  MyQuestions("السهم لا يشير للأعلى", false, Icons.arrow_upward),
  MyQuestions("السهم لا يشير للأسفل", false, Icons.arrow_downward),
  MyQuestions("السهم لا يشير لليسار", true, Icons.arrow_forward),
  MyQuestions("السهم يشير لليسار", true, Icons.arrow_back),
];
