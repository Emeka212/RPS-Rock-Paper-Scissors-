import 'package:flutter/material.dart';
import 'route/route.dart' as route; // Importing our route.dart file to the main.dart file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Removing the debug banna showing in the app
      debugShowCheckedModeBanner: false,
      title: 'Rock, Paper, Scissor Game',
      // code that is setting the first page you will see when u open your app
      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
    );
  }
}
