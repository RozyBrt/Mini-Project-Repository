import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final String task;

  const AddTaskScreen({required Key key, required this.task}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _taskController.text = widget.task;
    }
  }

  void _saveTask() {
    final String task = _taskController.text.trim();
    if (task.isNotEmpty) {
      Navigator.pop(context, task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Task Name',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
