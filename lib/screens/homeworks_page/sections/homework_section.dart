import 'package:alisood/models/Homework.dart';
import 'package:alisood/models/Homework.dart';
import 'package:alisood/models/ModelProvider.dart';
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
        : Center(child: Text('Your students dont have any homeworks'));
  }
}

class HomeworkWidget extends StatelessWidget {
  final double iconSize = 24.0;
  final Homework homework;

  HomeworkWidget({required this.homework});

  void _deleteHomework(BuildContext context) async {
    try {
      final request = ModelMutations.update(homework);

      await Amplify.API.mutate(request: request);
      //await Amplify.DataStore.delete(homework);
    } catch (e) {
      print('An error occurred while deleting Homework: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
    Homework updatedHomework = homework.copyWith(isFinished: !homework.isFinished!);
    try {
      await Amplify.DataStore.save(updatedHomework);
    } catch (e) {
      print('An error occurred while saving Homework: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: homework.isFinished! ? Colors.green : Colors.red,
      child: Container(
        width: MediaQuery.of(context).size.width*(0.9),
        height: MediaQuery.of(context).size.height*(0.2),
        child: InkWell(
          onTap: () {
            _toggleIsComplete();
          },
          onLongPress: () {
            _deleteHomework(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(homework.book!,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Assigned by : '+homework.teacher!),
                    Text('Page from : '+homework.pageStart!.toString()),
                    Text('Page to: '+homework.pageEnd!.toString()),


                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total time: ' + homework.time.toString()),
                  Text('Total pages : '+(homework.pageEnd! - homework.pageStart!).toString()),
                  Text('Note : '+ homework.teacherNote!),

                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}