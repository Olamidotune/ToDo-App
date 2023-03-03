import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todoItems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime today;
  String todoTask = '';
  final todosList = ToDo.todoList();

  @override
  void initState() {
    today = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(today),
                  style: largeText,
                ),
                const SizedBox(
                  height: 10,
                ),
               const Text(
                  'completed, uncompleted',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black54,
                ),
                const SizedBox(
                  height: 10,
                ),
                for (ToDo todo in todosList)
                  TodoItem(
                    todo: todo,
                    onDelete: _deleteToDoItems,
                    onToDoChanged: _toDoChange,
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popupDialog(context);
        },
        elevation: 20,
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void _toDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItems(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  popupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add task',
            style: normalText,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  todoTask = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  if (todoTask != 'value') {
                    todoTask;
                  } else {
                    Navigator.of(context).pop();
                    showSnackBar(
                        context, Colors.green, 'Field created successfully');
                  }
                });
              },
              child: const Text('Create'),
            )
          ],
        );
      },
    );
  }

  var dat = DateFormat.yMMMd();
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.black,
        onPressed: () {},
      ),
    ),
  );
}
