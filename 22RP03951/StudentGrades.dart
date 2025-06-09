// Enum to define possible grades
enum Grade { A, B, C, D, F }

void main() {
  // Constant value: cannot be changed
  const passingScore = 50;

  // final: assigned once at runtime
  final currentYear = DateTime.now().year;

  // List: collection of strings
  List<String> students = ['Alice', 'Bob', 'Charlie'];

  // Map: key-value pairs of student names and scores
  Map<String, int> scores = {'Alice': 75, 'Bob': 45, 'Charlie': 88};

  // Set: stores unique values only
  Set<int> uniqueScores = scores.values.toSet();

  // For-in loop: iterating over a list
  for (var student in students) {
    // Null safety: score might be null
    int? score = scores[student];

    // Assert: ensures score is not null
    assert(score != null, 'Score should not be null');

    // If-Else control flow: determining grade
    Grade grade;
    if (score! >= 80) {
      grade = Grade.A;
    } else if (score >= 70) {
      grade = Grade.B;
    } else if (score >= 60) {
      grade = Grade.C;
    } else if (score >= 50) {
      grade = Grade.D;
    } else {
      grade = Grade.F;
    }

    // Ternary operator: short if-else
    String result = (score >= passingScore) ? 'Pass' : 'Fail';

    print('$student scored $score -> Grade: $grade -> $result');
  }

  print('Unique scores: $uniqueScores');
  print('Year: $currentYear');
}
