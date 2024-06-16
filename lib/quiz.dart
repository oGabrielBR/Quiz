import 'package:flutter/material.dart';
import 'resultados.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _perguntaNumero = 0;
  int _acertos = 0;

  final List<Map<String, dynamic>> _quiz = [
    {
      "pergunta": "Qual o time da NBA com mais títulos?",
      "respostas": [
        "Golden State Warriors",
        "Miami Heat",
        "Los Angeles Lakers",
        "Boston Celtics",
      ],
      "alternativa_correta": 3,
      "imagem": "assets/Taça.jpg",
      "altura_imagem": 200.0,
      "cor_borda": Color.fromARGB(255, 243, 170, 33),
    },
    {
      "pergunta": "Qual jogador é conhecido como 'Slim Reaper' na NBA?",
      "respostas": [
        "Kyrie Irving",
        "Lebron James",
        "Stephen Curry",
        "Kevin Durant",
      ],
      "alternativa_correta": 3,
      "imagem": "assets/Reaper.jpg",
      "altura_imagem": 180.0,
      "cor_borda": const Color.fromARGB(255, 0, 0, 0),
    },
    {
      "pergunta": "Qual jogador é conhecido como 'The Don' na NBA?",
      "respostas": [
        "Trae Young",
        "Luka Doncic",
        "Ja Morant",
        "Jason Tatum",
      ],
      "alternativa_correta": 1,
      "imagem": "assets/Screenshot_2.png",
      "altura_imagem": 180.0,
      "cor_borda": Color.fromARGB(255, 4, 0, 255),
    },
    {
      "pergunta": "Qual o maior arremessador da linha de 3 pontos da NBA?",
      "respostas": [
        "Stephen Curry",
        "Luka Doncic",
        "Larry Bird",
        "Damian Lillard",
      ],
      "alternativa_correta": 0,
      "imagem": "assets/NBA-3-Point-Shooting.png",
      "altura_imagem": 150.0,
      "cor_borda": const Color.fromARGB(255, 255, 217, 0),
    },
    {
      "pergunta": "Quantos títulos tem Michael Jordan?",
      "respostas": [
        "6",
        "4",
        "5",
        "2",
      ],
      "alternativa_correta": 0,
      "imagem": "assets/michael-jordan.png",
      "altura_imagem": 180.0,
      "cor_borda": Color.fromARGB(255, 255, 0, 0),
    },
  ];

  void _responder(int index) {
    if (_quiz[_perguntaNumero]['alternativa_correta'] == index) {
      _acertos++;
    }
    setState(() {
      _perguntaNumero++;
    });
    if (_perguntaNumero >= _quiz.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Resultado(acertos: _acertos, totalPerguntas: 5,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz da NBA'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 1, 1),
              const Color.fromARGB(255, 255, 255, 255),
              Colors.blue,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _perguntaNumero < _quiz.length
                    ? Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Pergunta ${_perguntaNumero + 1} de ${_quiz.length}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _quiz[_perguntaNumero]['pergunta'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _quiz[_perguntaNumero]['cor_borda'] ?? Colors.black,
                                  width: 3,
                                )
                              ),
                              height: _quiz[_perguntaNumero]['altura_imagem'],
                              margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  _quiz[_perguntaNumero]['imagem'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: (_quiz[_perguntaNumero]['respostas'] as List<String>)
                                  .map((resposta) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: ElevatedButton(
                                    onPressed: () => _responder(
                                        _quiz[_perguntaNumero]['respostas'].indexOf(resposta)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      resposta,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }
}
