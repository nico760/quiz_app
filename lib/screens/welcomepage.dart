import 'package:database/screens/quizpage.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/quiz.png'),
                      fit: BoxFit.contain,
          )),
    ),
                ElevatedButton(
                  onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const QuizPage()));}, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                  textStyle: const TextStyle(fontSize: 20)
                  ),
                  child: const Text('Comenzar quiz'),
                  )
              ],
            ) ,),
          
    );
  }
}