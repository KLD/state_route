import 'package:flutter/material.dart';

import 'models/task.dart';

class TasksPage extends StatefulWidget {
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final tasks = <Task>[
    Task("Implement stateful widget"),
    Task("Push to Github"),
    Task("Create pull request"),
    Task("Fly some cats into space")
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text("Tasks"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Task",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        if (_controller.text.isEmpty) return;
                        tasks.add(Task(_controller.text));
                        _controller.clear();
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
              onEditingComplete: () {
                setState(() {
                  if (_controller.text.isEmpty) return;
                  tasks.add(Task(_controller.text));
                  _controller.clear();
                });
              },
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? Text("No tasks yay!")
                : ListView(
                    children: tasks
                        .map(
                          (task) => Card(
                            child: Row(
                              children: [
                                SizedBox(width: 12),
                                Checkbox(
                                    value: task.isComplete,
                                    onChanged: (value) {
                                      setState(() {
                                        task.isComplete = !task.isComplete;
                                      });
                                    }),
                                Expanded(child: Text(task.text)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        tasks.remove(task);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
