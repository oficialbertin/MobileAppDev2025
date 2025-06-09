void main() {
  // late variable: initialized later before use
  late String choice;

  // Using a while loop to simulate a menu
  int count = 0;

  while (count < 3) {
    count++;

    // Using ternary operator to select a choice
    choice = (count == 2) ? 'view' : (count == 3) ? 'exit' : 'add';

    // Switch statement for menu handling
    switch (choice) {
      case 'add':
        print('Adding item...');
        break;

      case 'view':
        print('Viewing items...');

        // Nested switch example
        switch (count) {
          case 2:
            print('Second view option');
            break;
        }
        break;

      case 'exit':
        print('Exiting...');
        break;

      // Default case if no match
      default:
        print('Invalid choice.');
    }

    // Break to stop the loop when 'exit' is selected
    if (choice == 'exit') break;

    // Continue could be used here if needed to skip to next loop
  }
}
