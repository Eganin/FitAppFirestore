import 'package:firestore_test/domain/workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget subtitle({BuildContext context, Workout data}) {
  Color color = Colors.grey;
  double indicatorLevel = 0;

  switch (data.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;

    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;

    case 'ADVANCED':
      color = Colors.red;
      indicatorLevel = 0.99;
      break;
  }

  return Row(
    children: [
      Expanded(
        flex: 3,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          // static animation
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 4,
        child: Text(
          data.level,
          style: TextStyle(color: Theme.of(context).textTheme.title.color),
        ),
      ),
    ],
  );
}
