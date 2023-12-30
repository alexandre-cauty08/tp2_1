import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Question.dart';

class ProviderQuestions extends ChangeNotifier{

  final List<Widget> score = [];
  int compteur = 0;
  int nbQuestion = 5;
  int questionNum = 0;
  bool fini = false;
  int total = 0;

  final List<Question> questions = [
    Question(questionText: "1+1 = 2", isCorrect: true),// 1
    Question(questionText: "1+2 = 2", isCorrect: false),// 2
    Question(questionText: "1+3 = 4", isCorrect: true),// 3
    Question(questionText: "1+2 = 3", isCorrect: true),// 4
    Question(questionText: "1+6 = 2", isCorrect: false),// 5
  ];
  late Question question;

  //  Constructeur
  ProviderQuestions()
  {
    question = questions[questionNum];
  }

  // Getters
  int get getcompteur => compteur;
  int get getnbQuestion => nbQuestion;
  int get getquestionNum => questionNum;
  bool get getfini => fini;
  int get gettotal => total;
  List<Question> get getquestions => questions;
  Question get getquestion => question;

  // Setters
  set setFini(bool n){
    fini = n;
    notifyListeners();
  }
  set setCompteur(int n){
    compteur = n;
    notifyListeners();
  }
  set setnbQuestion(int n){
    nbQuestion = n;
    notifyListeners();
  }
  set setTotal(int n){
    total = n;
    notifyListeners();
  }

  checkAnswer(bool choice, BuildContext context) {

    if (questions[questionNum].isCorrect == choice)
    {
      score.add(const Icon(Icons.check, color: Colors.green));
      total++;
      notifyListeners();
    }
    else
    {
      score.add(const Icon(Icons.close, color: Colors.red));
      notifyListeners();
    }
  }
  nextQuestion() {

    if (questionNum < questions.length-1)
    {
      questionNum++;
      questions[questionNum];
      notifyListeners();
    }
    else
    {
      fini = true;
      notifyListeners();
    }
  }

  reset(){
    questionNum = 0;
    total = 0;
    compteur = 0;
    fini = false;
    score.clear();
  }
}