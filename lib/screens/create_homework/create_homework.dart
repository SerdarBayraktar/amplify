import 'package:alisood/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
class CreateHomework extends StatefulWidget {
  @override
  _CreateHomeworkState createState() => _CreateHomeworkState();
}

class _CreateHomeworkState extends State<CreateHomework> {
  final _bookController = TextEditingController();
  final _startpageController = TextEditingController();
  final _endpageController = TextEditingController();
  final _timeController = TextEditingController();
  final _teacherNoteController = TextEditingController();

  Future<void> _saveHomework() async {
    String book = _bookController.text;
    int startPage = int.parse(_startpageController.text.toString());
    int endPage = int.parse(_endpageController.text.toString());
    int time = int.parse(_timeController.text.toString());
    String teacherNote = _teacherNoteController.text;
    Homework homework = Homework(
        book: book,
        teacher: 'Serdar',
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
                  decoration: InputDecoration(filled: true, labelText: 'Book Name')),
              TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(filled: true, labelText: 'Homework time in days')),
              TextFormField(
                  controller: _startpageController,
                  decoration: InputDecoration(filled: true, labelText: 'Which page does homework start?')),
              TextFormField(
                  controller: _endpageController,
                  decoration: InputDecoration(filled: true, labelText: 'Which page does homework end?')),
              TextFormField(
                  controller: _teacherNoteController,
                  decoration: InputDecoration(filled: true, labelText: 'Do you want to mention anything else')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _saveHomework,
      ),
    );
  }
}