import 'dart:io';

class MarksCalculator {
  List<String> subjects = [];
  List<int> marks = [];

  void inputSubjects() {
    print(
        "Enter the names of five subjects from the list [Social, Maths, CFA, English, Digital Logic]:");
    for (var i = 0; i < 5; i++) {
      stdout.write("Subject name: ");
      var subject = stdin.readLineSync();
      if (subject != null &&
          subject.isNotEmpty &&
          ['Social', 'Maths', 'CFA', 'English', 'Digital Logic']
              .contains(subject) &&
          !subjects.contains(subject)) {
        subjects.add(subject);
      } else {
        print(
            "Error: Please enter a unique subject from the list [Social, Maths, CFA, English, Digital Logic].");
        i--; 
      }
    }
  }

  void inputMarks() {
    print("Enter marks obtained in each subject:");
    for (var subject in subjects) {
      int? mark;
      do {
        stdout.write("Marks obtained in $subject: ");
        var markInput = stdin.readLineSync();
        if (markInput != null &&
            markInput.isNotEmpty &&
            markInput.contains(RegExp(r'^[0-9]+$'))) {
          mark = int.tryParse(markInput);
          if (mark != null && mark >= 0 && mark <= 100) {
            marks.add(mark);
          } else {
            print("Error: Marks should be between 0 and 100.");
          }
        } else {
          print("Error: Please enter a valid integer value for marks.");
        }
      } while (mark == null);
    }
  }

  void calculateTotalMarks() {
    var totalMarks = marks.reduce((value, element) => value + element);
    print("Total marks: $totalMarks");
  }
}
void test(int  ){
    
}

void main() {
  
  var marksCalculator = MarksCalculator();

  // Method 1: Asking subjects from the user
  marksCalculator.inputSubjects();

  // Method 2: Input marks obtained in each subject
  marksCalculator.inputMarks();

  // Method 3: Calculate total marks
  marksCalculator.calculateTotalMarks();
}
