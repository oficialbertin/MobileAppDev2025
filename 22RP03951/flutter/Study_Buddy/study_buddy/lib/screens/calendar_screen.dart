import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/task.dart';
import '../services/sqlite_service.dart';
import '../widgets/task_tile.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Task> _selectedTasks = [];
  List<Task> _allTasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final tasks = await SQLiteService().getTasks();
    setState(() {
      _allTasks = tasks;
      if (_selectedDay != null) {
        _selectedTasks = _allTasks.where((task) =>
          task.deadline.year == _selectedDay!.year &&
          task.deadline.month == _selectedDay!.month &&
          task.deadline.day == _selectedDay!.day
        ).toList();
      }
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _selectedTasks = _allTasks.where((task) =>
        task.deadline.year == selectedDay.year &&
        task.deadline.month == selectedDay.month &&
        task.deadline.day == selectedDay.day
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              _onDaySelected(selectedDay, focusedDay);
            },
          ),
          Expanded(
            child: _selectedDay == null
              ? Center(child: Text('Select a date to view tasks'))
              : _selectedTasks.isEmpty
                ? Center(child: Text('No tasks for this day'))
                : ListView.builder(
                    itemCount: _selectedTasks.length,
                    itemBuilder: (context, i) => TaskTile(
                      task: _selectedTasks[i],
                      onChanged: (updatedTask) async {
                        await SQLiteService().updateTask(updatedTask);
                        _loadTasks();
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
} 