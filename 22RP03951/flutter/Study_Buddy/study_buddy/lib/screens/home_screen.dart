import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/sqlite_service.dart';
import '../widgets/task_tile.dart';
import '../widgets/progress_bar.dart';
import '../widgets/motivational_quote.dart';
import 'add_task_screen.dart';
import 'calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    setState(() {
      _tasksFuture = SQLiteService().getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Buddy'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MotivationalQuote(),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: _tasksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text('No tasks yet. Tap + to add your first task!', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ),
                  );
                }
                final tasks = snapshot.data!;
                final completed = tasks.where((t) => t.isCompleted).length;
                return Column(
                  children: [
                    ProgressBar(
                      total: tasks.length,
                      completed: completed,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, i) => TaskTile(
                          task: tasks[i],
                          onChanged: (updatedTask) async {
                            await SQLiteService().updateTask(updatedTask);
                            _loadTasks();
                          },
                          onDelete: () async {
                            await SQLiteService().deleteTask(tasks[i].id!);
                            _loadTasks();
                          },
                          onEdit: () async {
                            // To be implemented: open edit screen
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          _loadTasks();
        },
      ),
    );
  }
} 