import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        'Quiz': (context) => Quiz(),
        'Resultados': (context) => Resultado(acertos: 0, totalPerguntas: 0,),
      },
    );
  }
}