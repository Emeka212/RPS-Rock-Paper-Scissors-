import 'package:flutter/material.dart';
import 'package:rps/variable/actions.dart';
import 'package:rps/components/component.dart';
import 'package:rps/routes/route.dart' as route;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //======================================
    navigator(value) {
      myScore = 0;
      if (pick == true) {
        nxtSection();
      }
      value == 'aboutPage'
          ? Navigator.pushNamed(context, route.aboutPage)
          : value == 'normalLevelPage'
              ? Navigator.pushNamed(context, route.normalLevelPage)
              : value == 'advanceLevelPage'
                  ? Navigator.pushNamed(context, route.advanceLevelPage)
                  : null;
    }

    //======================================
    return Scaffold(
      backgroundColor: const Color(0xff182343),
      body: Column(
        children: [
          Container(
            height: 90.0,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => navigator('aboutPage'),
              icon: const Icon(Icons.info_outlined),
              color: const Color(0xffec9e0e),
              iconSize: 30.0,
              splashColor: const Color(0xffc96d1a),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/app_logo.png'),
                          scale: 1.8,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        MyHomeBtn(onChanged: (value) => navigator(value))
                            .myHomeBtn('Normal Level', const Color(0xff4865f4),
                                const Color(0xff2543bd)),
                        MyHomeBtn(onChanged: (value) => navigator(value))
                            .myHomeBtn('Advance Level', const Color(0xffdc2e4e),
                                const Color(0xff9e1735)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
