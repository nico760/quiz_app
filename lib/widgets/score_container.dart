import 'package:flutter/material.dart';

class ScoreContainer extends StatelessWidget {
  const ScoreContainer({super.key,
  required this.actualScore});

  final String actualScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.orange
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
              const Text('Tu puntuación en este intento fue:', 
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
              Text(actualScore,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
              const SizedBox(height: 10,),
              const Text('Últimas puntuaciones:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
              ),
              ]
            )
      )
      ),
    );
  }
}