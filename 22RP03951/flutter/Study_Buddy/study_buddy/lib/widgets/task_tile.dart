import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<Task> onChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  TaskTile({required this.task, required this.onChanged, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text('${task.subject} • Due: ${task.deadline.toLocal()}'.split(' ')[0]),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: task.isCompleted,
            onChanged: (val) {
              onChanged(Task(
                id: task.id,
                title: task.title,
                subject: task.subject,
                deadline: task.deadline,
                isCompleted: val!,
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
            tooltip: 'Edit',
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
            tooltip: 'Delete',
          ),
        ],
      ),
    );
  }
} 