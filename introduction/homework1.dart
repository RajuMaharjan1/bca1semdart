import 'dart:io';

void main() {
  // Simulate ATM card insertion
  print("Please insert your ATM card.");
  String? cardInserted = stdin.readLineSync();

  if (cardInserted != null && cardInserted.toLowerCase() == 'inserted') {
    // Prompt for PIN
    print("Enter your PIN:");
    String? pinEntered = stdin.readLineSync();

    if (pinEntered != null && validatePin(pinEntered)) {
      // Display account options (assuming a simple checking account)
      print("Select an account:");
      print("1. Checking");

      String? accountSelected = stdin.readLineSync();

      if (accountSelected != null && accountSelected == '1') {
        // Display available balance (assuming a pre-defined value)
        double availableBalance = 1000.00; // Replace with logic to retrieve actual balance
        print("Your available balance is: Rs. $availableBalance");

        // Prompt for withdrawal amount
        print("Enter the amount you want to withdraw (in multiples of Rs. 100):");
        String? amountStr = stdin.readLineSync();

        if (amountStr != null) {
          int amount = int.tryParse(amountStr) ?? 0;

          if (amount > 0 && isValidWithdrawal(amount, availableBalance)) {
            // Simulate cash dispensing
            print("Dispensing Rs. $amount...");
            sleep(Duration(seconds: 2)); // Simulate dispensing time
            print("Please collect your cash.");

            // Update balance (assuming in-memory update for simplicity)
            availableBalance -= amount;
            print("Your remaining balance is: Rs. $availableBalance");
          } else {
            print("Invalid withdrawal amount. Please enter a positive amount in multiples of Rs. 100 and less than or equal to your available balance.");
          }
        } else {
          print("Invalid input for withdrawal amount.");
        }
      } else {
        print("Invalid account selection.");
      }
    } else {
      print("Invalid PIN. Please try again.");
    }
  } else {
    print("Please insert your ATM card properly.");
  }

  // Simulate ATM card removal
  print("Please remove your ATM card.");
}

bool validatePin(String pin) {
  // Replace with logic to validate PIN against a stored value (e.g., from a database)
  return pin == '1234'; // Placeholder for actual PIN validation
}

bool isValidWithdrawal(int amount, double availableBalance) {
  return amount % 100 == 0 && amount <= availableBalance; // Check for multiples of 100 and sufficient balance
}