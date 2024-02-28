import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    super.key,
    required this.taskTitle,
  });

  final taskTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
