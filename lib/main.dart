// dart async library we will refer to when setting up real time updates
import 'dart:async';
// flutter and ui libraries
import 'package:alisood/providers/content_provider.dart';
import 'package:alisood/screens/homeworks_page/homeworks_page.dart';
import 'package:flutter/material.dart';
// amplify packages we will need to use
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:provider/provider.dart';
// amplify configuration and models that should have been generated for you
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContentProvider(),
      child: MaterialApp(
        title: 'Amplified Todo',
        home: HomeworksPage(),
      ),
    );
  }
}