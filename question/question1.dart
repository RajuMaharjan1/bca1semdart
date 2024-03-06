import 'dart:io';
void main(){
   int total=0;
   print("Enter the number of students:");
  int numberOfStudents = int.parse(stdin.readLineSync()!);
      List<int> marks = [];
      for(int i=0;i<numberOfStudents;i++){
        for (int j = 0; j < 5; j++) {
         stdout.write('Enter mark for subject ${j + 1}: ');
         int mark = int.parse(stdin.readLineSync() ?? '0');
         marks.add(mark);
          
        }
      
         for (int i = 0; i < numberOfStudents; i++) {
    
    double percentage = total / 5;
    String division;

    if (percentage >= 80) {
      division = 'Distinction';
    } else if (percentage >= 60) {
      division = 'First Division';
    } else if (percentage >= 40) {
      division = 'Second Division';
    } else {
      division = 'Fail';
    }

   
    
    print('Percentage: ${percentage.toStringAsFixed(2)}%');
    print('Division: $division');
  }
      }
        }
      
