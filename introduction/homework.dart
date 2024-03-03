import 'dart:io';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

void main() {
  // Sample product list
  List<Product> products = [
    Product("DELl", 200000),
    Product("TOshiba", 30000),
    Product("Mac", 200000),
  ];

  // Display product list
  print("Products:");
  for (int i = 0; i < products.length; i++) {
    print("${i + 1}. ${products[i].name} - Rs. ${products[i].price}");
  }

  // User input for product selection
  print("Enter product number (1-${products.length}) or 'q' to quit:");
  String? productInput = stdin.readLineSync();

  if (productInput != null && productInput.toLowerCase() != 'q') {
    int productIndex = int.tryParse(productInput) ?? -1;

    if (productIndex > 0 && productIndex <= products.length) {
      Product selectedProduct = products[productIndex - 1];

      // User input for quantity
      print("Enter quantity:");
      String? quantityInput = stdin.readLineSync();
      int quantity = int.tryParse(quantityInput!) ?? 1;

      // Delivery option selection
      print("Select delivery option:");
      print("1. Home (Rs. 1000)");
      print("2. Pickup (Rs. Free)");
      String? deliveryInput = stdin.readLineSync();
      double deliveryCost = 0.0;
      if (deliveryInput != null) {
        switch (deliveryInput) {
          case '1':
            deliveryCost = 1000;
            break;
          case '2':
            deliveryCost = 0.00;
            break;
          default:
            print("Invalid delivery option.");
        }
      }

      // Packing option selection
      print("Select packing option:");
      print("1. Plastic (Rs. 500)");
      print("2. Standard Bag Packing (Rs. 1000)");
      print("3. Gift Box (Rs. 5000)");
      String? packingInput = stdin.readLineSync();
      double packingCost = 0.0;
      if (packingInput != null) {
        switch (packingInput) {
          case '1':
            packingCost = 500;
            break;
          case '2':
            packingCost = 1000;
            break;
            case '3':
            packingCost = 5000;
            break;
          default:
            print("Invalid packing option.");
        }
      }

      // Location selection
      print("Select location:");
      print("1. Kathmandu");
      print("2. Latipur");
      print("3. Bhaktapur");
      String? locationInput = stdin.readLineSync();
      String location = "N/A";
      if (locationInput != null) {
        switch (locationInput) {
          case '1':
            location = "kathmandu";
            break;
          case '2':
            location = "Latipur";
            break;
          case '3':
            location = "Bhaktapur";
            break;
          default:
            print("Invalid location.");
        }
      }

      // Calculate subtotal, tax (assumed 10%), and grand total
      double subtotal = quantity * selectedProduct.price;
      double tax = subtotal * 0.10;
      double grandTotal = subtotal + tax + deliveryCost + packingCost;

      // Display final bill
      print("\nYour Order:");
      print(" - Product: ${selectedProduct.name} (x$quantity)");
      print(" - Subtotal: Rs. $subtotal");
      print(" - Tax (10%): Rs. $tax");
      print(" - Delivery: Rs. $deliveryCost");
      print(" - Packing: Rs. $packingCost");
      print(" - Location: $location");
      print(" - Grand Total: Rs. $grandTotal");

    } else {
      print("Invalid product number.");
    }
  } else {
    print("Exiting...");
  }
}