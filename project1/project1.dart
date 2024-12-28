// Define the abstract Role interface
abstract class Role {
  void displayRole();
}

// Define the Person class
class Person implements Role {
  String name;
  int age;
  String address;

  Person({required this.name, required this.age, required this.address});

  @override
  void displayRole() {
    // This method will be overridden in subclasses
    print("Role: Person");
  }
}

// Define the Student class
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    int totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }
}

// Define the Teacher class
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Define the main class for the Student Management System
class StudentManagementSystem {
  void run() {
    // Create instances of Student and Teacher
    var student = Student(
      name: "John Doe",
      age: 20,
      address: "123 Main St",
      studentID: "S123",
      grade: "A",
      courseScores: [90, 85, 82],
    );

    var teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      teacherID: "T456",
      coursesTaught: ["Math", "English", "Bangla"],
    );

    // Display Student Information
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.name}");
    print("Age: ${student.age}");
    print("Address: ${student.address}");
    print("Average Score: ${student.calculateAverageScore()}");
    print("");

    // Display Teacher Information
    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.name}");
    print("Age: ${teacher.age}");
    print("Address: ${teacher.address}");
    teacher.displayCourses();
  }
}

void main() {
  var system = StudentManagementSystem();
  system.run();
}

