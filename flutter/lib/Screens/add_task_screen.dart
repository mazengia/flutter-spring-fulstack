
import 'package:fluter_roject/models/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          Container(
            margin:  const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextField(
              autofocus: true,
              onChanged: (val) {
                taskTitle = val;
              },
            ),
          ),
          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80.0),
            child: TextButton(onPressed: () {
                if (taskTitle.isNotEmpty) {
                  Provider.of<TasksData>(context, listen: false).addTask(taskTitle);
                  Navigator.pop(context);
                }
                else{

                }
              },
            child: const Text('Add',style: TextStyle(color: Colors.white), ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}