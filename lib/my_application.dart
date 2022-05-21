import 'package:alisood/providers/content_provider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
class MyApplication extends StatefulWidget {
  const MyApplication({Key? key}) : super(key: key);
  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ContentProvider(),
        child: MaterialApp(
          title: 'Amplify Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text('Amplify'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'asd',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
  void _configureAmplify() async {
    // await Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line after backend is deployed
    await Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }







}
