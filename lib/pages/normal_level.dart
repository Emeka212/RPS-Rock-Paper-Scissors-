import 'package:flutter/material.dart';
import 'package:rps/variable/actions.dart';
import 'package:rps/variable/all_color.dart';
import 'package:rps/components/component.dart';

class NormalLevelPage extends StatefulWidget {
  const NormalLevelPage({Key? key}) : super(key: key);
  @override
  State<NormalLevelPage> createState() => _NormalLevelPageState();
}

class _NormalLevelPageState extends State<NormalLevelPage> {
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
                                    const Text(
                                      'YOU PICKED',
                                      style: TextStyle(
                                        color: Color(0xffefefef),
                                        fontWeight: FontWeight.bold,
                                        height: 3.5,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    whatComPicked,
                                    const Text(
                                      'THE HOUSE PICKED',
                                      style: TextStyle(
                                        color: Color(0xffefefef),
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
                                  style: const TextStyle(
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                      decoration: const BoxDecoration(
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
                                RPS(
                                  onChanged: (value) {
                                    user(value, 'normalLevel');
                                    setState(() => nxtSection());
                                  },
                                ).rps(
                                    const Color(0xff4865f4),
                                    const Color(0xff2543bd),
                                    const AssetImage(
                                        'assets/img/icon-paper.png')),
                                RPS(
                                  onChanged: (value) {
                                    user(value, 'normalLevel');
                                    setState(() => nxtSection());
                                  },
                                ).rps(
                                    const Color(0xffec9e0e),
                                    const Color(0xffc96d1a),
                                    const AssetImage(
                                        'assets/img/icon-scissors.png')),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: RPS(
                                onChanged: (value) {
                                  user(value, 'normalLevel');
                                  setState(() => nxtSection());
                                },
                              ).rps(
                                  const Color(0xffdc2e4e),
                                  const Color(0xff9e1735),
                                  const AssetImage('assets/img/icon-rock.png')),
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
              ).ruleCon(ruleImg),
          ],
        ),
      ),
    );
  }
}
