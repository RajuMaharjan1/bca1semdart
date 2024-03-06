import 'dart:io';

class StudentMarks {
  List<int> marks = [];

  void getMarks(int numberOfStudents) {
    for (int i = 1; i <= numberOfStudents; i++) {
      stdout.write("Enter marks for student $i: ");
      int mark = int.parse(stdin.readLineSync()!);
      marks.add(mark);
    }
  }

  int total() {
    return marks.reduce((value, element) => value + element);
  }

  String division() {
    double average = total() / marks.length;

    if (average >= 90) {
      return "First Division";
    } else if (average >= 80) {
      return "Second Division";
    } else if (average >= 70) {
      return "Third Division";
    } else {
      return "Fail";
    }
  }

  void display() {
    print("\nStudent Marks: $marks");
    print("Total Marks: ${total()}");
    print("Division: ${division()}");
  }
}

void main() {
  print("Enter the number of students: ");
  int numberOfStudents = int.parse(stdin.readLineSync()!);

  var studentMarks = StudentMarks();
  studentMarks.getMarks(numberOfStudents);
  studentMarks.display();
}