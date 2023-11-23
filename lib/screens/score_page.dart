import 'package:database/widgets/question_text.dart';
import 'package:database/widgets/score_container.dart';
import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/score.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key,
  required this.pscore
  });

  final int pscore;

  @override
  ScorePageState createState() => ScorePageState();
}

class ScorePageState extends State<ScorePage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List<Score> _scores = [];

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  void _loadScore() async {
    final score = await _databaseHelper.getScore();
    setState(() {
      _scores = score;
    });
  }

  Future<void> _addScore() async {
    final int nscore = widget.pscore;



    final Score newScore = Score(
      nscore: nscore,
    );

    await _databaseHelper.insert(newScore);
    _loadScore();
  }

  Future<void> _clearScore() async{
    await _databaseHelper.clearScores();
    _loadScore();
  }


  @override
  Widget build(BuildContext context) {
    final actualScore = widget.pscore;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 226, 117),
        title: const Text('Puntuación'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          )),
        child: Column(
          children: [
            ScoreContainer(actualScore: '$actualScore'),
            Expanded(
              child: ListView.builder(
                itemCount: _scores.length,
                itemBuilder: (context, index) {
                  final score = _scores[index];
                  final puntaje = score.nscore;
                  return QuestionText(
                    question:'$puntaje', alto: 50,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _addScore,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                        textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('Guardar'),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: _clearScore,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                        textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('Borrar'),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: (){Navigator.pop(context);},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,
                        textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('Volver'),
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
