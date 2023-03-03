import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDelete})
      : super(key: key);
  final ToDo todo;
  final onToDoChanged;
  final onDelete;

  final bool check = false;
  final String todoTitle = '';
  final String todoSubtitle = '';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onDelete(todo.id);
        print('deleted');
      },
      onTap: () {
        onToDoChanged;
        print('object');
      },
      tileColor: Colors.transparent,
      leading: Icon(todo.isDone ? Icons.check : Icons.check_box_outline_blank),
      title: Text(
        todo.title!,
        style: TextStyle(color: todo.isDone ? Colors.red : null),
      ),
      subtitle: Text(
        todo.subTitle!,
        style: TextStyle(color: todo.isDone ? Colors.red : null),
      ),
    );
  }
}
