import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskHome extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Task Manager with API")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => taskProvider.fetchTasks(),
            child: Text("Fetch Tasks"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Task",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                taskProvider.addTask(_controller.text);
                _controller.clear();
              }
            },
            child: Text("Add Task"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => taskProvider.deleteTask(task.id),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
