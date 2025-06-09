// Arithmetic, Relational, Logical, and Assignment Operations in Dart

void main() {
  // 1. Arithmetic Operations
  int a = 10;
  int b = 3;

  print('Addition: ${a + b}');      
  print('Subtraction: ${a - b}');   
  print('Multiplication: ${a * b}');
  print('Division: ${a / b}');      
  print('Integer Division: ${a ~/ b}');
  print('Modulus: ${a % b}');        

  // 2. Relational (Comparison) Operators
  int x = 5;
  int y = 10;

  print(x == y); // false
  print(x != y); // true
  print(x > y);  // false
  print(x < y);  // true
  print(x >= y); // false
  print(x <= y); // true

  // 3. Logical Operators
  bool isTrue = true;
  bool isFalse = false;

  print(isTrue && isFalse); // false
  print(isTrue || isFalse); // true
  print(!isTrue);           // false

  // 4. Assignment Operators
  int c = 5;
  c += 3; // c = c + 3
  print(c); // 8

  c *= 2; // c = c * 2
  print(c); // 16

  c -= 4;
  print(c); // 12
}
