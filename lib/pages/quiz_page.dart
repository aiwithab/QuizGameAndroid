import 'package:flutter/material.dart';
import 'package:quiz/UI/question_text.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is Human", false),
    new Question("Flutter is awsome", true),
    new Question("My UI skills are great", true),
    new Question("This game is simple and cool", true),
    new Question("Our prime mininster is lazy", true),
    new Question("Maharashtra is a city", false),
    new Question("India got its indipendence on 26/1/1947", false),
    new Question("ISRO is mobile company", false),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer ==  answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // this is our main page
        children: <Widget>[
          new AnswerButton(true,() => handleAnswer(true)),
          new QuestoinText(questionText,questionNumber),
          new AnswerButton(false,() => handleAnswer(false)),
        ],
      ),
       overlayShouldBeVisible == true ? new CorrectWrongOverlay(
         isCorrect,
         () {
           if (quiz.length == questionNumber) {
             Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
           }
         currentQuestion = quiz.nextQuestion;
         this.setState(() {
           overlayShouldBeVisible = false;
           questionText = currentQuestion.question;
           questionNumber = quiz.questionNumber;
         });
       },
       ) : new Container(),
      ],
    );
  }
}