import 'package:flutter/material.dart';
import 'package:rps/variable/actions.dart';
import 'package:rps/variable/allColor.dart';
import '../component/component.dart';

class NormalLevelPage extends StatefulWidget {
  @override
  _NormalLevelPageState createState() => _NormalLevelPageState();
}

class _NormalLevelPageState extends State<NormalLevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor().bgColor,
      body: new Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: new Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Column(
                children: [
                  ScoreCon().scoreCon(
                    myScore,
                    GameName().gameName('ROCK'),
                    GameName().gameName('PAPER'),
                    GameName().gameName('SCISSORS'),
                  ),
                  if (pick)
                    new Expanded(
                      child: new Container(
                        padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        whatUserPicked,
                                        Text(
                                          'YOU PICKED',
                                          style: TextStyle(
                                            color: Color(0xffefefef),
                                            fontWeight: FontWeight.bold,
                                            height: 3.5,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        whatComPicked,
                                        Text(
                                          'THE HOUSE PICKED',
                                          style: TextStyle(
                                            color: Color(0xffefefef),
                                            fontWeight: FontWeight.bold,
                                            height: 3.5,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    whoWon,
                                    style: TextStyle(
                                      color: Color(0xffefefef),
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  PlayAgainBtn(
                                    onChanged: (value) {
                                      setState(() => nxtSection());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    new Expanded(
                      child: new Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/bg-triangle.png'),
                            scale: 1.3,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RPS(onChanged: (value) {
                                      user(value, 'normalLevel');
                                      setState(() => nxtSection());
                                    },).rps(Color(0xff4865f4), Color(0xff2543bd), AssetImage('assets/img/icon-paper.png')),
                                  RPS(onChanged: (value) {
                                      user(value, 'normalLevel');
                                      setState(() => nxtSection());
                                    },).rps(Color(0xffec9e0e), Color(0xffc96d1a), AssetImage('assets/img/icon-scissors.png')),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: RPS(onChanged: (value) {
                                    user(value, 'normalLevel');
                                    setState(() => nxtSection());
                                  },).rps(Color(0xffdc2e4e), Color(0xff9e1735), AssetImage('assets/img/icon-rock.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  RuleBtn(
                    onChanged: (value) {
                      setState(() {
                        toogleRule();
                      });
                    },
                  ),
                ],
              ),
            ),
            if (showRuleCon)
              RuleCon(
                onChanged: (value) {
                  setState(() {
                    toogleRule();
                  });
                },
              ).ruleCon(ruleImg),
          ],
        ),
      ),
    );
  }
}
