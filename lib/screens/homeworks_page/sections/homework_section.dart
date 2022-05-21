import 'package:alisood/models/Homework.dart';
import 'package:alisood/models/Homework.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
class HomeworkSection extends StatelessWidget {
  final List<Homework> homeworks;

  HomeworkSection({required this.homeworks});

  @override
  Widget build(BuildContext context) {
    return homeworks.length >= 1
        ? ListView(
        padding: EdgeInsets.all(8),
        children: homeworks.map((homework) => HomeworkWidget(homework: homework)).toList())
        : Center(child: Text('Yey you dont have any homework'));
  }
}

class HomeworkWidget extends StatelessWidget {
  final double iconSize = 24.0;
  final Homework homework;

  HomeworkWidget({required this.homework});

  void _deleteHomework(BuildContext context) async {
    try {
      await Amplify.DataStore.delete(homework);
    } catch (e) {
      print('An error occurred while deleting Homework: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    Homework updatedHomework = homework.copyWith(isFinished: !homework.isFinished);
    try {
      await Amplify.DataStore.save(updatedHomework);
    } catch (e) {
      print('An error occurred while saving Homework: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteHomework(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(homework.book,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(homework.teacher),
                ],
              ),
            ),
            Icon(
                homework.isFinished
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: iconSize),
          ]),
        ),
      ),
    );
  }
}