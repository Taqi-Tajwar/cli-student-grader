import 'dart:io';

void main(){

  const  appTitle = "Student Grader v1.0";

  final availableSubjects = {"Bangla","Math", "English", "Science"};

  var students = <Map<String,dynamic>>[];
  var isRunning = true;
  var userInput;

  do{
    print("""
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:
""");

    userInput=stdin.readLineSync();

    switch(userInput){
      case '1':
        print("You selected: Add Student");
        break;

      case '2':
        print("You selected: Record Score");
        break;

      case '3':
        print("You selected: Add Bonus Points");
        break;

      case '4':
        print("You selected: Add Comment");
        break;

      case '5':
        print("You selected: View All Students");
        break;

      case '6':
        print("You selected: View Report Card");
        break;

      case '7':
        print("You selected: Class Summary");
        break;

      case '8':
        print("Exiting app");
        isRunning = false;
        break;

      default:
        print("Invalid option. Try again!");
    }
  }while (isRunning);
}
