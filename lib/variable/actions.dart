import 'dart:math';
import 'all_color.dart';
import 'package:flutter/material.dart';
import 'package:rps/component/component.dart';

//==============================================
// FOR THE SCORE 
//==============================================
int myScore = 0;
score(String v) {
  v == '+ive' ? myScore++ : myScore--;
}

//===================================================
// FOR THE RULE POP UP BOX AND BTN (WITH THE LAVEL IMGS)
//===================================================
const ruleImg =  AssetImage('assets/img/image-rules.png');
const ruleImg2 = AssetImage('assets/img/image-rules-bonus.png');

bool showRuleCon = false;
void toogleRule() {
  showRuleCon = showRuleCon == false ? true : false;
}

//==========================================================
// FOR SHOWING THE NXT SECTION AFTER A USER HAVE PICK A CARD
//==========================================================
bool pick = false;
void nxtSection() {
  pick = pick == false ? true : false;
}

//====================================================
// ASSIGNING THE BOX SHADOW VAR TO A SHORTER VAR
//====================================================
final boxShadow = Shadow().boxShadow();
var indicate = '';

//====================================================
// ASSIGNING EACH GAME CARD TO A VAR
//====================================================
class RelevantCard{
  final rock = RPS(onChanged: (value){}).rps(GameColor().rockColor, GameColor().rockShadowColor, const AssetImage('assets/img/icon-rock.png'), indicate == 'rock' ? boxShadow : null);
  final paper = RPS(onChanged: (value){}).rps(GameColor().paperColor, GameColor().paperShadowColor, const AssetImage('assets/img/icon-paper.png'), indicate == 'paper' ? boxShadow : null);
  final scissors = RPS(onChanged: (value){}).rps(GameColor().scissorColor, GameColor().scissorShadowColor, const AssetImage('assets/img/icon-scissors.png'), indicate == 'scissors' ? boxShadow : null);
  final lizard = RPS(onChanged: (value){}).rps(GameColor().lizardColor, GameColor().lizardShadowColor, const AssetImage('assets/img/icon-lizard.png'), indicate == 'lizard' ? boxShadow : null);
  final spock = RPS(onChanged: (value){}).rps(GameColor().spockColor, GameColor().spockShadowColor, const AssetImage('assets/img/icon-spock.png'), indicate == 'spock' ? boxShadow : null);
}

//=====================================================
// ASSINGING THE NAME OF CARD A USER PICK TO A VAR
//=====================================================
var whatUserPicked;
var userPick;
user(String value, String level) {
  userPick = value;
  comPickFunction(level);
  whatUserPicked = value == 'rock' ? RelevantCard().rock
                  : value == 'paper' ? RelevantCard().paper
                  : value == 'scissors' ? RelevantCard().scissors
                  : value == 'lizard' ? RelevantCard().lizard
                  : value == 'spock' ? RelevantCard().spock
                  : null;
}

//===========================================================================
// ASSINGING THE NAME OF CARD THE COMP PICK TO A VAR (AFTER RANDOMLY PICKING)
//===========================================================================
var whatComPicked;
var comPick;
var random;

comPickFunction(String level){
  level == 'normalLevel' ? random = Random().nextInt(3) : random = Random().nextInt(5) ;
  random == 0 ? comPick = 'rock':
  random == 1 ? comPick = 'paper':
  random == 2 ? comPick = 'scissors':
  random == 3 ? comPick = 'lizard':
  random == 4 ? comPick = 'spock': null;
  whoWin();
  var gameArr = [RelevantCard().rock, RelevantCard().paper, RelevantCard().scissors, RelevantCard().lizard, RelevantCard().spock];
  whatComPicked = gameArr[random];
}

//============================================================
// CODE TO DICTECT WHO HAS WON THE GAME (THE USER OR THE COMP)
//============================================================
var whoWon = '';
whoWin() {
  if (
    userPick == 'rock' && comPick == 'paper' ||
    userPick == 'rock' && comPick == 'spock' ||
    userPick == 'paper' && comPick == 'scissors' ||
    userPick == 'paper' && comPick == 'lizard' ||
    userPick == 'scissors' && comPick == 'rock' ||
    userPick == 'scissors' && comPick == 'spock' ||
    userPick == 'spock' && comPick == 'paper' ||
    userPick == 'spock' && comPick == 'lizard' ||
    userPick == 'lizard' && comPick == 'scissors' ||
    userPick == 'lizard' && comPick == 'rock'
  ) {
    [whoWon = 'YOU LOSS', score('-ive'), indicate = comPick];
  } else if (
    userPick == 'rock' && comPick == 'scissors' ||
    userPick == 'rock' && comPick == 'lizard' ||
    userPick == 'paper' && comPick == 'rock' ||
    userPick == 'paper' && comPick == 'spock' ||
    userPick == 'scissors' && comPick == 'paper' ||
    userPick == 'scissors' && comPick == 'lizard' ||
    userPick == 'spock' && comPick == 'scissors' ||
    userPick == 'spock' && comPick == 'rock' ||
    userPick == 'lizard' && comPick == 'spock' ||
    userPick == 'lizard' && comPick == 'paper'
  ) {
    [whoWon = 'YOU WIN', score('+ive'), indicate = userPick];
  } else {
    [whoWon = 'Drawed', indicate = ''];
  }
}