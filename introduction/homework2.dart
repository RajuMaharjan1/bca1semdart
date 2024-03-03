import 'dart:io';
import 'dart:math';

void main() {
  // Simulate call duration (replace with actual call duration logic)
  int callDuration = getRandomInt(0, 100);

  // User input for SIM card types
  print("Enter calling SIM card type (NTC or Ncell):");
  String? callingSim = stdin.readLineSync()?.toUpperCase();

  print("Enter receiving SIM card type (NTC or Ncell):");
  String? receivingSim = stdin.readLineSync()?.toUpperCase();

  // Validate SIM card types
  if (callingSim == null || receivingSim == null ||
      !['NTC', 'NCELL'].contains(callingSim) ||
      !['NTC', 'NCELL'].contains(receivingSim)) {
    print("Invalid SIM card type. Please enter 'NTC' or 'NCELL'.");
    return;
  }

  // Calculate base call rate (replace with actual rate)
  double baseRate = 1.0; // Rs. 1 per minute

  // Calculate charges based on call type and duration
  double totalCharge = 0.0;
  if (callingSim == receivingSim) {
    totalCharge = callDuration * baseRate;
    if (callingSim == 'NTC') {
      totalCharge -= callDuration >= 10 ? 2.5 : 0.0; // Bonus for NTC-NTC calls exceeding 10 minutes
    } else {
      totalCharge = 0.0; // Free calls for Ncell-Ncell
    }
  } else {
    totalCharge = callDuration * baseRate;
    if (callingSim == 'NTC') {
      totalCharge -= callDuration >= 10 ? 3.5 : 0.0; // Bonus for NTC-Ncell calls exceeding 10 minutes
    } else {
      totalCharge -= callDuration >= 10 ? 5.5 : 0.0; // Bonus for Ncell-NTC calls exceeding 10 minutes
    }
  }

  // Display call details
  print("\nCall Details:");
  print(" - Call Duration: $callDuration minutes");
  print(" - Calling SIM: $callingSim");
  print(" - Receiving SIM: $receivingSim");
  print(" - Base Charge: Rs. ${callDuration * baseRate}");
  print(totalCharge > 0 ? " - Bonus Applied: Rs. ${callDuration >= 10 ? (callingSim == 'NTC' ? 2.5 : 5.5) : 0.0}" : "");
  print(" - Total Charge: Rs. $totalCharge");
}

int getRandomInt(int min, int max) {
  // Replace with your preferred random number generator
  return min + Random().nextInt(max - min + 1);
}