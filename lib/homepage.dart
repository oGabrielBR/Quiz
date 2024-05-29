import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz da NBA'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Cor do appbar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 1, 1),
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/pngegg.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, 'Quiz');
  },
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 250, 250, 250), padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Cor do texto do botão
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Text(
    'Iniciar Quiz',
    style: TextStyle(fontSize: 24),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}
