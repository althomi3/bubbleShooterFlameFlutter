import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {

  final double textsize;

  const ScoreCard({
    super.key,
    required this.score,
    required this.textsize,

  });

  final ValueNotifier<int> score;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: score,
      builder: (context, score, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
          child: Text(
            'Score: $score'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith( // inherits style from parents
              fontSize: textsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
