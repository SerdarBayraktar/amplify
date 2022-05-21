import 'dart:async';

import 'package:alisood/models/ModelProvider.dart';
import 'package:alisood/models/Todo.dart';
import 'package:alisood/screens/create_homework/create_homework.dart';
import 'package:alisood/screens/homeworks_page/sections/homework_section.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../../amplifyconfiguration.dart';
import '../../main.dart';
class HomeworksPage extends StatefulWidget {
  @override
  _HomeworksPageState createState() => _HomeworksPageState();
}

class _HomeworksPageState extends State<HomeworksPage> {

  bool _isLoading = true;
  List<Homework> _homeworks = [];
  final AmplifyDataStore _dataStorePlugin =
  AmplifyDataStore(modelProvider: ModelProvider.instance);
  late StreamSubscription<QuerySnapshot<Homework>> _subscription;

  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();

    _subscription = Amplify.DataStore.observeQuery(Homework.classType)
        .listen((QuerySnapshot<Homework> snapshot) {
      setState(() {
        if (_isLoading) _isLoading = false;
        _homeworks = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins([_dataStorePlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('An error occurred while configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homeworks'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : HomeworkSection(homeworks: _homeworks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
