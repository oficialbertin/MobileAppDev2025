class Task {
  int? id;
  String title;
  String subject;
  DateTime deadline;
  bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.subject,
    required this.deadline,
    this.isCompleted = false,
  });

  // For SQLite
  factory Task.fromMapSQLite(Map<String, dynamic> data) {
    return Task(
      id: data['id'],
      title: data['title'],
      subject: data['subject'],
      deadline: DateTime.parse(data['deadline']),
      isCompleted: data['isCompleted'] == 1,
    );
  }

  Map<String, dynamic> toMapSQLite() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'deadline': deadline.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
} 