import 'package:database/screens/score_page.dart';
import 'package:database/widgets/question_text.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  List<String> questions = [
    'El Sol es una estrella.', // Verdadero
    'El agua hierve a 100 grados Celsius.', // Verdadero
    'La Luna es un planeta.', // Falso
    'La Tierra es plana.', // Falso
    'El ser humano tiene 2 piernas.', // Verdadero
    'El perro es un mamífero.', // Verdadero
    'La suma de los ángulos internos de un triángulo es 180 grados.', // Verdadero
    'El hierro es un elemento químico líquido.', // Falso
    'El código de barras fue inventado en los años 1920.', // Falso
    'La luz viaja más rápido que el sonido.', // Verdadero
  ];

  List<String> answers = [
    'Verdadero',
    'Verdadero',
    'Falso',
    'Falso',
    'Verdadero',
    'Verdadero',
    'Verdadero',
    'Falso',
    'Falso',
    'Verdadero',
  ];

  int questionIndex = 0;
  int correctCount = 0;
  
  void checkAnswer(bool isTrue) {
    String selectedAnswer = isTrue ? 'Verdadero' : 'Falso'; //lo cambiamos de bool a string, porque en la lista de answers tenemos strings y no booleanos 
    String correctAnswer = answers[questionIndex];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text(
            selectedAnswer == correctAnswer ? '¡Correcto!' : '¡Incorrecto!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (selectedAnswer == correctAnswer) {
                  setState(() {
                    correctCount++;
                  });
                }
                if (questionIndex < questions.length - 1) {
                  setState(() {
                    questionIndex++;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Fin del Cuestionario'),
                        content: const Text('Has completado todas las preguntas.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScorePage(pscore: correctCount)));
                            },
                            child: const Text('Guarda el puntaje'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                questionIndex = 0;
                                correctCount = 0;
                              });
                            },
                            child: const Text('Reintenta'),
                          )
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          )),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionText(question: questions[questionIndex],
              alto: 150.0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => checkAnswer(true),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Verdadero'), 
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                    textStyle: const TextStyle(fontSize: 20)
                  ),
                    child: const Text('Falso'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              QuestionText(question: 'Aciertos: $correctCount',
                          alto: 50.0,
              )
            ],
          ),
        ),
    );
  }
}