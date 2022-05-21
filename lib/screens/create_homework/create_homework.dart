import 'package:alisood/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
class CreateHomework extends StatefulWidget {
  @override
  _CreateHomeworkState createState() => _CreateHomeworkState();
}

class _CreateHomeworkState extends State<CreateHomework> {
  final _bookController = TextEditingController();
  final _teacherController = TextEditingController();
  final _startpageController = TextEditingController();
  final _endpageController = TextEditingController();
  final _timeController = TextEditingController();
  final _teacherNoteController = TextEditingController();

  Future<void> _saveHomework() async {
    String book = _bookController.text;
    String teacher = _teacherController.text;
    int startPage = int.parse(_startpageController.text.toString());
    int endPage = int.parse(_endpageController.text.toString());
    int time = int.parse(_timeController.text.toString());
    String teacherNote = _teacherNoteController.text;
    Homework homework = Homework(
        book: book,
        teacher: teacher,
        time: time,
        pageStart:  startPage,
        pageEnd: endPage,
        startDateTime: DateTime.now().millisecondsSinceEpoch,
        teacherNote: teacherNote,
        isFinished: false,
    );

    try {
      await Amplify.DataStore.save(homework);
      Navigator.of(context).pop();
    } catch (e) {
      print('An error occurred while saving Homework: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assing Homework'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _bookController,
                  decoration: InputDecoration(filled: true, labelText: 'Name')),
              TextFormField(
                  controller: _teacherController,
                  decoration:
                  InputDecoration(filled: true, labelText: 'Description')),
              ElevatedButton(onPressed: _saveHomework, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}