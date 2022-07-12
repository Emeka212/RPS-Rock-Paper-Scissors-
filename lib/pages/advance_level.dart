import 'package:flutter/material.dart';
import 'package:rps/variable/actions.dart';
import 'package:rps/variable/all_color.dart';
import 'package:rps/components/component.dart';

class AdvanceLevelPage extends StatefulWidget {
  const AdvanceLevelPage({Key? key}) : super(key: key);
  @override
  State<AdvanceLevelPage> createState() => _AdvanceLevelPage();
}

class _AdvanceLevelPage extends State<AdvanceLevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor().bgColor,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                ScoreCon().scoreCon(
                  myScore,
                  GameName().gameName('ROCK'),
                  GameName().gameName('PAPER'),
                  GameName().gameName('SCISSORS'),
                  GameName().gameName('LIZARD'),
                  GameName().gameName('SPOCK'),
                ),
                if (pick)
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    whatUserPicked,
                                    Text(
                                      'YOU PICKED',
                                      style: TextStyle(
                                        color: GameColor().btnBgColor,
                                        fontWeight: FontWeight.bold,
                                        height: 3.5,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    whatComPicked,
                                    Text(
                                      'THE HOUSE PICKED',
                                      style: TextStyle(
                                        color: GameColor().btnBgColor,
                                        fontWeight: FontWeight.bold,
                                        height: 3.5,
                                      ),
                                    )
                                  ],
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
                                    color: GameColor().btnBgColor,
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 25.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          scale: 1.3,
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/img/bg-pentagon.png'),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: RPS(
                                onChanged: (value) {
                                  user(value, 'advanceLevel');
                                  setState(() => nxtSection());
                                },
                              ).rps(
                                  GameColor().scissorColor,
                                  GameColor().scissorShadowColor,
                                  const AssetImage(
                                      'assets/img/icon-scissors.png')),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RPS(
                                    onChanged: (value) {
                                      user(value, 'advanceLevel');
                                      setState(() => nxtSection());
                                    },
                                  ).rps(
                                      GameColor().spockColor,
                                      GameColor().spockShadowColor,
                                      const AssetImage(
                                          'assets/img/icon-spock.png')),
                                  RPS(
                                    onChanged: (value) {
                                      user(value, 'advanceLevel');
                                      setState(() => nxtSection());
                                    },
                                  ).rps(
                                      GameColor().paperColor,
                                      GameColor().paperShadowColor,
                                      const AssetImage(
                                          'assets/img/icon-paper.png')),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RPS(
                                    onChanged: (value) {
                                      user(value, 'advanceLevel');
                                      setState(() => nxtSection());
                                    },
                                  ).rps(
                                      GameColor().lizardColor,
                                      GameColor().lizardShadowColor,
                                      const AssetImage(
                                          'assets/img/icon-lizard.png')),
                                  RPS(
                                    onChanged: (value) {
                                      user(value, 'advanceLevel');
                                      setState(() => nxtSection());
                                    },
                                  ).rps(
                                      GameColor().rockColor,
                                      GameColor().rockShadowColor,
                                      const AssetImage(
                                          'assets/img/icon-rock.png')),
                                ],
                              ),
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
            if (showRuleCon)
              RuleCon(
                onChanged: (value) {
                  setState(() {
                    toogleRule();
                  });
                },
              ).ruleCon(ruleImg2),
          ],
        ),
      ),
    );
  }
}
