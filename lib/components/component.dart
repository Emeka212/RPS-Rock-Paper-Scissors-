import 'package:flutter/material.dart';
import 'package:rps/variable/all_color.dart';

//======================================================================
// THIS CODE HANDLE THE BTN THAT LEAD THE USER TO ANY OF THE BOTH PAGES
//======================================================================
class MyHomeBtn extends StatelessWidget {
  final ValueChanged onChanged;
  const MyHomeBtn({Key? key, required this.onChanged}) : super(key: key);

  Widget myHomeBtn(var btnValue, var btnColor, var btnSplashColor) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: TextButton(
          onPressed: () => onChanged(btnValue == 'Normal Level'
              ? "normalLevelPage"
              : "advanceLevelPage"),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: btnColor,
            onSurface: btnSplashColor,
            shadowColor: Colors.black45,
            elevation: 5,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          child: Text(btnValue),
        ),
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

//==================================================================
// THIS CODE HANDLE THE WAY THE TXT DISPLAY ON THE SCOPRE CONNTAINER
//==================================================================
class GameName {
  Widget gameName(final String txtName) {
    return Text(
      txtName,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

//==========================================================
// THIS CODE HANDLE THE SCORE CONTAINER FOR BOTH PAGES
//==========================================================
class ScoreCon {
  Widget scoreCon(var score, var arg1, var arg2, var arg3,
      [var arg4, var arg5]) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1.5, color: Colors.white54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              arg1,
              arg2,
              arg3,
              arg4 ?? const SizedBox(),
              arg5 ?? const SizedBox()
            ],
          ),
          Container(
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SCORE',
                  style: TextStyle(
                    color: Color(0xff2a46c0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$score',
                  style: const TextStyle(
                    color: Color(0xff3b4363),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//==========================================================
// THIS CODE HANDLE THE RULE BTN FOR EACH PAGE/GAME
//==========================================================
class RuleBtn extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  const RuleBtn({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1.5, color: Colors.white54),
      ),
      child: TextButton(
        onPressed: () => onChanged(true),
        child: const Text('RULES', style: TextStyle(letterSpacing: 2.0)),
        style: TextButton.styleFrom(
          primary: const Color(0xffd2d2d2),
        ),
      ),
    );
  }
}

//=======================================================================================================
// THE CODE HANDLE THE LARGE RULE CONTAINER THAT DISPLAY ON BOTH PAGE WHEN THE RULE BTN HAVE BEEN CLICKED
//=======================================================================================================
class RuleCon extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  const RuleCon({Key? key, required this.onChanged}) : super(key: key);

  Widget ruleCon(var imgName) {
    return Container(
      width: double.infinity,
      height: 300.0,
      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xfff5f5f5),
      ),
      child: Column(
        children: [
          const Text(
            'RULES',
            style: TextStyle(
              color: Color(0xff3b4363),
              fontSize: 40.0,
              letterSpacing: 0.5,
              fontFamily: 'Nunito',
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 1.4,
                  image: imgName,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => onChanged(true),
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

//========================================================================
// THIS CODE HANDLE THE LARGE BOX SHADOW U SEE ON A CARD THAT WON THE GAME
//========================================================================
class Shadow {
  List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
        color: GameColor().winningShadowColor3,
        spreadRadius: 52.0,
      ),
      BoxShadow(
        color: GameColor().winningShadowColor2,
        spreadRadius: 36.0,
      ),
      BoxShadow(
        color: GameColor().winningShadowColor1,
        spreadRadius: 18.0,
      ),
    ];
  }
}

//==========================================================================
// THIS CODE HANDLE THE CARD U ARE SEEING E.G (ROCK, PAPER, SCISSORS, E.T.C)
//==========================================================================
class RPS extends StatelessWidget {
  final ValueChanged onChanged;
  const RPS({Key? key, required this.onChanged}) : super(key: key);

  Widget rps(final fColor, final sColor, final img, [final boxShadow]) {
    var whatIPicked = fColor == GameColor().paperColor
        ? 'paper'
        : fColor == GameColor().scissorColor
            ? 'scissors'
            : fColor == GameColor().rockColor
                ? 'rock'
                : fColor == GameColor().lizardColor
                    ? 'lizard'
                    : fColor == GameColor().spockColor
                        ? 'spock'
                        : null;

    return GestureDetector(
      onTap: () => onChanged(whatIPicked),
      child: Container(
        width: 110.5,
        height: 115.0,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: sColor,
          borderRadius: BorderRadius.circular(200.0),
          boxShadow: boxShadow,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: fColor,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: GameColor().innerShadowColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: GameColor().whiteColor,
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  scale: 1.5,
                  image: img,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

//======================================================================
// THIS CODE HANDLE THE PLAY AGAIN BUTTON AFTER A USER HAVE PICK A CARD
//======================================================================
class PlayAgainBtn extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  const PlayAgainBtn({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: SizedBox(
        width: 200.0,
        height: 50.0,
        child: TextButton(
          onPressed: () => onChanged(false),
          child: const Text(
            'PLAY AGAIN',
            style: TextStyle(
              color: Color(0xff3b4363),
              fontSize: 20.0,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffefefef),
          ),
        ),
      ),
    );
  }
}

//==================================================================
// THIS CODE HANDLE THE SOCIAL ICON OPTIONS TO CONATCT THE DEVELOPER
//==================================================================
const String myNum = '+2349026560079';
const String myMail = 'stephenugo939@gmail.com';
const String subject = 'ROCK, PAPER AND SCISSORS GAME APP';
const String body =
    'I love your mobile game and i will like to give some feedbacks, /n My name is: ';
const String myPortfolio = 'https://mc-stephen.000webhostapp.com';
const String myFacebookLink = 'https://facebook.com/ejima';

// class Util{
//   static Future _launchURL(String iconDetails) async {
//     final String url = iconDetails == 'Portfolio' ? myPortfolio :
//                       iconDetails == 'Facebook' ? myFacebookLink :
//                       iconDetails == 'Gmail' ? 'mailto:$myMail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}' :
//                       iconDetails == 'Num' ? 'tel:$myNum' : '';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

class SociaIcon {
  Widget socialIcon(iconName, iconDetails) {
    return IconButton(
      // onPressed: () => Util._launchURL(iconDetails),
      onPressed: () {},
      splashColor: Colors.pinkAccent,
      icon: Icon(
        iconName,
        color: Colors.pink,
        size: 30,
      ),
    );
  }
}
