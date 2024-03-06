import 'dart:io';
import 'dart:math';

void main() {

  int callDuration = getRandomInt(0, 100);

 
  print("Enter calling SIM card type (NTC or Ncell):");
  String? callingSim = stdin.readLineSync()?.toUpperCase();

  print("Enter receiving SIM card type (NTC or Ncell):");
  String? receivingSim = stdin.readLineSync()?.toUpperCase();

  
  if (callingSim == null || receivingSim == null ||
      !['NTC', 'NCELL'].contains(callingSim) ||
      !['NTC', 'NCELL'].contains(receivingSim)) {
    print("Invalid SIM card type. Please enter 'NTC' or 'NCELL'.");
    return;
  }

 
  double baseRate = 1.0;

  
  double totalCharge = 0.0;
  if (callingSim == receivingSim) {
    totalCharge = callDuration * baseRate;
    if (callingSim == 'NTC') {
      totalCharge -= callDuration >= 10 ? 2.5 : 0.0;
    } else {
      totalCharge = 0.0;
    }
  } else {
    totalCharge = callDuration * baseRate;
    if (callingSim == 'NTC') {
      totalCharge -= callDuration >= 10 ? 3.5 : 0.0;
    } else {
      totalCharge -= callDuration >= 10 ? 5.5 : 0.0; 
    }
  }

 
  print("\nCall Details:");
  print(" - Call Duration: $callDuration minutes");
  print(" - Calling SIM: $callingSim");
  print(" - Receiving SIM: $receivingSim");
  print(" - Base Charge: Rs. ${callDuration * baseRate}");
  print(totalCharge > 0 ? " - Bonus Applied: Rs. ${callDuration >= 10 ? (callingSim == 'NTC' ? 2.5 : 5.5) : 0.0}" : "");
  print(" - Total Charge: Rs. $totalCharge");
}

int getRandomInt(int min, int max) {
 
  return min + Random().nextInt(max - min + 1);
}