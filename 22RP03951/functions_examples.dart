// Regular function: simple function with no parameters 
void greet() {
  print("Hello from a regular function!");
}

// Function with parameters
void greetUser(String name) {
  print("Hello, $name!");
}

// Arrow function: short-hand function with a single expression
int add(int a, int b) => a + b;

// Function with optional positional parameters
void printDetails(String name, [int? age]) {
  print("Name: $name");
  if (age != null) {

    print("Age: $age");
  }
}

// Function with named parameters (order doesn't matter)
void registerUser({required String username, int age = 18}) {
  print("User: $username, Age: $age");
}

// Return value function
String getGreeting(String name) {
  return "Welcome, $name!";
}

// Implicit return type (returns last expression automatically)
int multiply(int a, int b) => a * b;

// Void function: performs action but returns nothing
void sayGoodbye() {
  print("Goodbye!");
}

// Higher-order function: takes another function as parameter
void executeTask(Function task) {
  print("Starting task...");
  task(); // Executes the passed-in function
  print("Task complete!");
}

// Lexical closure: inner function remembers variables from outer scope
Function makeMultiplier(int multiplier) {
  return (int value) => value * multiplier; // returns a function
}

// Generator function using sync* and yield
Iterable<int> generateEvenNumbers(int max) sync* {
  for (int i = 0; i <= max; i++) {
    if (i % 2 == 0) {
      yield i; // yields value lazily
    }
  }
}

void main() {
  // Regular function call
  greet();

  // Function with parameters
  greetUser("Rubangura");

  // Arrow function
  print("Sum: ${add(3, 5)}");

  // Optional parameters
  printDetails("Edson");
  printDetails("Charlene", 25);

  // Named parameters
  registerUser(username: "muhire32");
  registerUser(username: "munyana12", age: 22);

  // Return value
  String msg = getGreeting("Frank");
  print(msg);

  // Implicit return
  int product = multiply(4, 6);
  print("Product: $product");

  // Void function
  sayGoodbye();

  // Higher-order function
  executeTask(() {
    print("This is a custom task inside a higher-order function.");
  });

  // Lexical closure
  var triple = makeMultiplier(3);
  print("Triple of 6: ${triple(6)}");

  // Generator function usage
  print("Even numbers up to 10:");
  for (var num in generateEvenNumbers(10)) {
    print(num);
  }
}
