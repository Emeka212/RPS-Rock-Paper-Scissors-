import 'package:flutter/material.dart';
import 'package:rps/variable/all_color.dart';
import 'package:rps/components/component.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor().bgColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
            child: const ClipOval(
              child: Image(
                image: AssetImage('assets/img/profile1.jpg'),
              ),
            ),
          ),
          const Text(
            'Emeka Michael (MC-STEPHEN)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
            child: const Text(
              'Am a full-stack web and mobile (flutter) developer, i create website and apps for small and large businesses, do u have a project in mind, if so pls do feel free to contact me using any of the options below.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SociaIcon().socialIcon(Icons.web, 'Portfolio'),
                SociaIcon().socialIcon(Icons.facebook_outlined, 'Facebook'),
                SociaIcon().socialIcon(Icons.mail, 'Gmail'),
                SociaIcon().socialIcon(Icons.phone, 'Num'),
              ],
            ),
          ),
          const Text(
            'Other Apps',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontSize: 20.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: const ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                width: 50.0,
                image: AssetImage('assets/img/kakula.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
