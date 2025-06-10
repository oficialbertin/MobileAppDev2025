enum DaysOfWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

void main() {
  // Retrieve all days
  print(DaysOfWeek.values);

  // Retrieve a day by index
  print(DaysOfWeek.values[0]); // Output: DaysOfWeek.Monday

  // Retrieve a day by name
  String name = "Sunday";
  DaysOfWeek? day = DaysOfWeek.values.firstWhere(
    (d) => d.toString().split('.').last == name,
    orElse: () => DaysOfWeek.Monday, // Default to Monday if not found
  );
  print(day); // Output: DaysOfWeek.Sunday
}