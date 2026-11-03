
void main() {
  String student = "Student";
  int age = 19;
  double rating = 4.5;
  bool availableToTeach = true;

  List<String> teachSkills = ["Flutter", "Java", "Dart"];

  print("=== SkillSwap Student Details ===");
  print("Name: $student");
  print("Age: $age");
  print("Rating: $rating");
  print("Available to teach: $availableToTeach");

  print("\nSkills I can teach:");
  for (String skill in teachSkills) {
    print("- $skill");
  }

  String learnSkill = "UI Design";
  print("\nSkill I want to learn: $learnSkill");

  if (availableToTeach) {
    print("$student is ready for a skill exchange!");
  }
}

