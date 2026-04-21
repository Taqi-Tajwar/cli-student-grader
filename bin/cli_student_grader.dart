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
        print("Enter student name:");
        var name = stdin.readLineSync();

        var student = {
          "name": name,
          "scores": <String, List<int>>{},
          "subjects": {...availableSubjects},
          "bonus": null,
          "comment": null
        };

        students.add(student);
        print("Student $name added successfully.\n");
        break;

      case '2':
        if (students.isEmpty) {
          print("No students available!\n");
          break;
        }

        for (int i = 0; i < students.length; i++) {
          print("$i. ${students[i]["name"]}");
        }

        print("Select student:");
        int studentIndex = int.parse(stdin.readLineSync()!);

        if (studentIndex < 0 || studentIndex >= students.length) {
          print("Invalid student!\n");
          break;
        }

        var student = students[studentIndex];

        var subjectList = student["subjects"].toList();

        for (int i = 0; i < subjectList.length; i++) {
          print("$i. ${subjectList[i]}");
        }

        print("Select subject:");
        int subjectIndex = int.parse(stdin.readLineSync()!);

        if (subjectIndex < 0 || subjectIndex >= subjectList.length) {
          print("Invalid subject!\n");
          break;
        }

        var selectedSubject = subjectList[subjectIndex];

        int score;
        while (true) {
          print("Enter score (0-100):");
          score = int.parse(stdin.readLineSync()!);

          if (score >= 0 && score <= 100) break;
          print("Invalid! Try again.");
        }

        student["scores"][selectedSubject] ??= <int>[];

        student["scores"][selectedSubject].add(score);

        print("Score added to $selectedSubject!\n");
        break;

      case '3':
        if (students.isEmpty) {
          print("No students available!\n");
          break;
        }

        print("Student List:");
        for (int i = 0; i < students.length; i++) {
          print("$i. ${students[i]["name"]}");
        }

        print("Select student:");
        int index = int.parse(stdin.readLineSync()!);

        if (index < 0 || index >= students.length) {
          print("Invalid student!\n");
          break;
        }

        var student = students[index];

        int bonus;

        while (true) {
          print("Enter bonus (1-10):");
          bonus = int.parse(stdin.readLineSync()!);

          if (bonus >= 1 && bonus <= 10) break;
          print("Invalid bonus! Try again.");
        }

        if (student["bonus"] == null) {
          student["bonus"] ??= bonus;
          print("Bonus added\n");
        } else {
          print("Bonus already exists: ${student["bonus"]}\n");
        }
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
