import 'dart:io';

void main() {
  
  print("Please insert your ATM card.");
  String? cardInserted = stdin.readLineSync();

  if (cardInserted != null && cardInserted.toLowerCase() == 'inserted') {
   
    print("Enter your PIN:");
    String? pinEntered = stdin.readLineSync();

    if (pinEntered != null && validatePin(pinEntered)) {
     
      print("Select an account:");
      print("1. Checking");

      String? accountSelected = stdin.readLineSync();

      if (accountSelected != null && accountSelected == '1') {
      
        double availableBalance = 1000.00; 
        print("Your available balance is: Rs. $availableBalance");

        
        print("Enter the amount you want to withdraw (in multiples of Rs. 100):");
        String? amountStr = stdin.readLineSync();

        if (amountStr != null) {
          int amount = int.tryParse(amountStr) ?? 0;

          if (amount > 0 && isValidWithdrawal(amount, availableBalance)) {
            
            print("Dispensing Rs. $amount...");
            sleep(Duration(seconds: 2));
            print("Please collect your cash.");

           
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


  print("Please remove your ATM card.");
}

bool validatePin(String pin) {

  return pin == '1234'; 
}

bool isValidWithdrawal(int amount, double availableBalance) {
  return amount % 100 == 0 && amount <= availableBalance;
}