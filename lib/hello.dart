import 'dart:io';
import 'package:guess_number_2/game.dart';
void printSeperate(){
  print("╟────────────────────────────────────────────");
}
void printStat(List<int> list){
  for(var i = 0;i<list.length;i++){
    print('Game #${i+1}: ${list[i]} guesses');
  }
}

void main() {
  var playAgain = false;
  List<int> list = [];
  var temp;
  var g ;

  do {
    var inputMax,max;

    do {
      stdout.write("Enter a maximum number to random: ");
      inputMax = stdin.readLineSync();
      if(inputMax == '') {
        g = Game();
        break;
      }
      max = int.tryParse(inputMax!);
      if(max == null)
        continue;
      else {
        g = Game(maxRandom: max!);
        break;
      }
    }while(true);

    int result = 0;
    print("╔════════════════════════════════════════════");
    print("║             GUESS THE NUMBER");
    printSeperate();

    do {
      if(max == null)
        stdout.write('║ Guess the number between 1 and 100 : ');
      else
        stdout.write('║ Guess the number between 1 and $max : ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        continue;
      }

      result = g.doGuess(guess);
    } while (result != 1);

    print("║                 THE END");
    print("╚════════════════════════════════════════════");


    do {
      stdout.write("Play again (Y/N) : ");
      var play = stdin.readLineSync();
      if (play == 'Y' || play == 'y') {
        playAgain = true;
        break;
      } else if (play == 'N' || play == 'n') {
        playAgain = false;
        break;
      }
    }while(true);
    list.add(g.getGuesstimes());
  }while(playAgain);

  printStat(list);

}