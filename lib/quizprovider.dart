import 'package:flutter/material.dart';
import 'package:ui_task_6/model.dart';

class QuizProvider extends ChangeNotifier {
  int quizIndex = 0;
  int totalScore = 0;
  List<ModelQuiz> quizList = data;
  Future<String> answer(int index, String ans) async {
    if (ans == quizList[index].answer) {
      totalScore++;
      notifyListeners();
      print(' score :${totalScore}');
    } else {
      print('score : $totalScore');
    }
    Future.delayed(
      Duration(seconds: 2),
      () {
        quizIndex=quizIndex+1;
        notifyListeners();
        print(quizIndex);
      },
    );

    if (quizIndex == quizList.length - 1) {
      print('end score ; $totalScore');
      quizIndex = 0;
    }
    return quizList[index].answer;
  }
}
