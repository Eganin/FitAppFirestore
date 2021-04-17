import 'package:firestore_test/domain/workout.dart';
import 'package:firestore_test/ui/widgets/list/subtitle.dart';
import 'package:flutter/material.dart';

class WorkoutList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Brain',
        description: 'SHIZAAA',
        level: LevelWorkout.BEGINNER.value),
    Workout(
        title: 'Test2',
        author: 'Brain',
        description: 'SHIZAAA',
        level: LevelWorkout.INTERMEDIATE.value),
    Workout(
        title: 'Test3',
        author: 'Brain',
        description: 'SHIZAAA',
        level: LevelWorkout.ADVANCED.value),
    Workout(
        title: 'Test4',
        author: 'Brain',
        description: 'SHIZAAA',
        level: LevelWorkout.BEGINNER.value),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    50,
                    65,
                    85,
                    0.9,
                  ),
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.only(
                      right: 12,
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(width: 1, color: Colors.white24),
                    )),
                  ),
                  title: Text(
                    workouts[index].title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.title.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                  subtitle: subtitle(
                    context: context,
                    data: workouts[index],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

enum LevelWorkout {
  BEGINNER,
  INTERMEDIATE,
  ADVANCED,
}

extension LevelWorkoutExtension on LevelWorkout {
  String get value {
    switch (this) {
      case LevelWorkout.ADVANCED:
        return 'Advanced';

      case LevelWorkout.BEGINNER:
        return 'Beginner';

      case LevelWorkout.INTERMEDIATE:
        return 'Intermediate';
    }
  }
}
