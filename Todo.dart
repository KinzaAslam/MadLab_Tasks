//Main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/todoapp.dart';
import 'package:provider_todo_app/todoappmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoModel>(
      create: (context) => TodoModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text("To-doApp"),
          ),
          body: TodoApp(),
        ),
      ),
    );
  }
}

//TodoApp.dart

import 'package:flutter/material.dart';
import 'package:provider_todo_app/todoappmodel.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  final TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoModel todos = Provider.of<TodoModel>(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: todos.allTasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos.allTasks[index].taskTitle),
                      trailing: TextButton(
                          onPressed: () {
                            todos.deleteTask(todos.allTasks[index]);
                          },
                          child: Text("DONE")),
                    );
                  }),
            ),
          ),
          Container(
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  controller: t1,
                )),
                ElevatedButton(
                  onPressed: () {
                    todos.addTask(Task(taskTitle: t1.text));
                    t1.clear();
                  },
                  child: Text("ADDED"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TodoAppModel.dart

import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get allTasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

class Task {
  String taskTitle;
  bool isCompleted;

  Task({@required this.taskTitle}) {
    isCompleted = false;
  }
}
