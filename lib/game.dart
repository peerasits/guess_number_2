import 'dart:math';

import 'package:guess_number_2/hello.dart';

class Game{
  var answer;
  var guessTime;
  static final List<int> list = [];


  Game({int maxRandom = 100}){
    this.answer = Random().nextInt(maxRandom)+1;
    guessTime = 0;
  }

  printAnswer(){
    //print("คำตอบคือ $answer");
  }

  int getGuesstimes(){
    return guessTime;
  }

  int get getGuessTime{
    return guessTime;
  }


  int doGuess(var num){

    if (num > answer) {
      print("║ ➜ $num is TOO HIGH! ▲");
      printSeperate();
      guessTime++;
      return 0;
    } else if (num < answer) {
      print("║ ➜ $num is TOO LOW! ▼");
      printSeperate();
      guessTime++;
      return 0;
    } else {
      ++guessTime;
      print("║ ➜ $num is CORRECT ❤, total guesses : $guessTime");
      printSeperate();
      return 1;

    }
  }
}