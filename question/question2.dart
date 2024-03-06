void main() {
  
  List<int> numbers = [34, 65, 65, 77, 87, 89];

  
  int total = numbers.reduce((sum, element) => sum + element);

 
  Set<int> uniqueNumbers = numbers.toSet();

   
  print("Total: $total");
  print("Unique values: $uniqueNumbers");
}