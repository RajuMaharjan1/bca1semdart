import 'dart:io';

void main() {
  int numStudents;

 
  print("Enter the number of students: ");
  String? input = stdin.readLineSync();
  try {
    numStudents = int.parse(input!);
  } on FormatException {
    print("Invalid input. Please enter a number.");
    return;
  }

  
  for (int i = 1; i <= numStudents; i++) {
    print("Enter marks of student:");

   
    List<int> marks = [];
    int total = 0;

   
    for (int j = 1; j <= 5; j++) {
      print("Subject $j: ");
      String? markInput = stdin.readLineSync();
      if (markInput != null) {
        try {
          int mark = int.parse(markInput);
          if (mark >= 0 && mark <= 100) {
            marks.add(mark);
            total += mark;
          } else {
            print("Invalid mark. Please enter a value between 0 and 100.");
            j--; 
          }
        } on FormatException {
          print("Invalid input. Please enter a number.");
          j--;
        }
      } else {
        print("Error reading input.");
        return;
      }
    }

    
    double percentage = total / 5.0;
    String division = calculateDivision(percentage);

    print("Student $i:");
    print(" Total marks: $total");
    print(" Percentage: $percentage%");
    print(" Division: $division");
    print("");
  }
}


String calculateDivision(double percentage) {
  if (percentage >= 90) {
    return "First";
  } else if (percentage >= 80) {
    return "Second";
  } else if (percentage >= 70) {
    return "Third";
  } else if (percentage >= 40) {
    return "Pass";
  } else {
    return "Fail";
  }
}