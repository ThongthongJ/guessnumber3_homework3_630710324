import 'dart:math';

class Game {
  int answer = -1;

  Game({int maxRandom = 100}) {

    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
  }

  int getAnswer(){
    return answer;
  }
  int doGuess(int num){
    if (num > answer){
      return 1;
    } else if ( num < answer){
      return 2;
    } else{
      return 3;
    }
  }
}
