import 'dart:io';

enum Location { buspark, machapokhari, balaju, dharagali, sorakuttya, thamel, jamal }

void main() {
  double totalDistance = 0;
  double totalPrice = 0;
  bool isStudent = false;

  // Ask if user is a studenty
  print("Are you a student? (y/n)");
  String answer = stdin.readLineSync()!.toLowerCase();
  isStudent = answer == 'y';

  Location currentLocation = Location.buspark;

  while (true) {
    print("\nCurrent Location: ${currentLocation.name}");
    print("Available Destinations:");
    print("1. Machapokhari (5 km)");
    print("2. Balaju (5 km)");
    print("3. Dharagali (5 km)");
    print("4. Sorakuttya (5 km)");
    print("5. Thamel (5 km)");
    print("6. Jamal (5 km)");
    print("7. Exit");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        if (currentLocation == Location.buspark) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.machapokhari;
        } else {
          print("Invalid choice. You can't go back.");
        }
        break;
      case 2:
        if (currentLocation == Location.machapokhari) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.balaju;
        } else {
          print("Invalid choice. You can only travel forward.");
        }
        break;
      case 3:
        if (currentLocation == Location.balaju) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.dharagali;
        } else {
          print("Invalid choice. You can only travel forward.");
        }
        break;
      case 4:
        if (currentLocation == Location.dharagali) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.sorakuttya;
        } else {
          print("Invalid choice. You can only travel forward.");
        }
        break;
      case 5:
        if (currentLocation == Location.sorakuttya) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.thamel;
        } else {
          print("Invalid choice. You can only travel forward.");
        }
        break;
      case 6:
        if (currentLocation == Location.thamel) {
          totalDistance += 5;
          totalPrice += 15.0;
          currentLocation = Location.jamal;
        } else {
          print("Invalid choice. You can only travel forward.");
        }
        break;
      case 7:
        break;
      default:
        print("Invalid choice.");
    }

    if (choice == 7) {
      break;
    }

    // Apply student discount
    if (isStudent) {
      totalPrice *= 0.9; // 10% discount
      print("Student discount applied!");
    }

    print("Total Distance: $totalDistance km");
    print("Total Price: Rs. ${totalPrice.toStringAsFixed(2)}");
  }

  print("\nThank you for using our bus service!");
}

extension LocationName on Location {
  String get name {
    switch (this) {
      case Location.buspark:
        return "Buspark";
      case Location.machapokhari:
        return "Machapokhari";
      case Location.balaju:
        return "Balaju";
      case Location.dharagali:
        return "Dharagali";
      case Location.sorakuttya:
        return "Sorakuttya";
      case Location.thamel:
        return "Thamel";
      case Location.jamal:
        return "Jamal";
    }
  }
} 