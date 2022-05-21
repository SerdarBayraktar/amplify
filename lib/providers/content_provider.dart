import 'package:alisood/models/Todo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ContentProvider extends ChangeNotifier{
  final item = Todo(
      name: "Lorem ipsum dolor sit amet",
      description: "Lorem ipsum dolor sit amet",
      isComplete: true);
  create() async {
    await Amplify.DataStore.save(item);
  }

  update() async {

    final updatedItem = item.copyWith(
        name: "Lorem ipsum dolor sit amet",
        description: "Lorem ipsum dolor sit amet",
        isComplete: true);
    await Amplify.DataStore.save(updatedItem);
  }
  delete() async {
    await Amplify.DataStore.delete(item);
  }

  read() async {
    try {
      List<Todo> Todos = await Amplify.DataStore.query(Todo.classType);
    } catch (e) {
      print("Could not query DataStore: " + e.toString());
    }
  }

}