import 'package:fluter_roject/Services/database_services.dart';
import 'package:fluter_roject/models/task.dart';
import 'package:fluter_roject/models/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../task_tile.dart';
import 'add_task_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;
  getTasks() async {
    tasks = (await DatabaseServices.getTasks()).cast<Task>();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Todo trial Tasks (${Provider.of<TasksData>(context).tasks.length})',
              ),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Center(
              child: Consumer<TasksData>(
                builder: (context, tasksData, child) {
                  return ListView.builder(
                      itemCount: tasksData.tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasksData.tasks[index];
                        return TaskTile(
                          task: task,
                          tasksData: tasksData,
                        );
                      });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddTaskScreen();
                    });
              },
            ),
          );
  }
}
